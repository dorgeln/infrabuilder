#terraform_plugin.py

from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

DOCUMENTATION = r'''
    name: terraform-inventory
    plugin_type: inventory
    short_description: Returns Ansible inventory from Terraform
    description: Returns Ansible inventory from Terraform
    options:
      plugin:
          description: Name of the plugin
          required: true
          choices: ['terraform-inventory']
      project_path:
        description: Directory location of the terraform project
        required: true
'''

from ansible.plugins.inventory import BaseInventoryPlugin
from ansible.errors import AnsibleError, AnsibleParserError
import subprocess
import json
import os


class InventoryModule(BaseInventoryPlugin):
    NAME = 'terraform'

    def verify_file(self,path):
        '''Return true/false if this is possibly a valid file for this plugin to consume'''
        #valid=False
        #if super(InventoryModule, self).verify_file(path):
        #    valid=True
        return True

    
    def parse(self, inventory, loader, path, cache):
        '''Return dynamic inventory from source '''
        super(InventoryModule, self).parse(inventory, loader, path, cache)
        self._read_config_data(path)
        try:
            self.plugin = self.get_option('plugin')
            self.project_path = self.get_option('project_path')
        except Exception as e:
            raise AnsibleParserError(
                'All correct options required: {}'.format(e))
        
        tfstate_cmd=subprocess.run("terraform state pull",cwd=self.project_path, capture_output=True, shell=True, check=True)

        print(tfstate_cmd.stdout)
        tfstate=json.loads(tfstate_cmd.stdout)

        for r in tfstate['resources']:
            if 'instances' in r:
                for i in r['instances']:
                    if 'attributes' in i:
                        a = i['attributes']

                        if 'name' in a and 'access_ip_v4' in a:
                            host= a['name']
                            ansible_host = a['access_ip_v4']

                            if 'all_metadata' in a:
                                if 'group' in a['all_metadata']:

                                    group=a['all_metadata']['group']
                                    self.inventory.add_group(group)
                                    self.inventory.add_host(host=host, group=group)
                                    self.inventory.set_variable(host, 'ansible_host', ansible_host)

                                for metadata in a['all_metadata']:
                                    self.inventory.set_variable(host, metadata , a['all_metadata'][metadata])


    
                                



   



