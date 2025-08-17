import React from 'react';
import { Box, Button, Section } from 'tgui-core/components';

import { useBackend } from '../backend';
import { NtosWindow } from '../layouts';
import { Manifest, ManifestTable } from './CrewManifestSS1984';

type Data = {
  manifest: Manifest;
};

export const NtosCrewManifest1984 = (props) => {
  const { act, data } = useBackend<Data>();
  const { manifest = {} as Manifest } = data ?? {};
  return (
    <NtosWindow width={500} height={480}>
      <NtosWindow.Content scrollable>
        <Section
          title="Crew Manifest"
          buttons={
            <Button
              icon="print"
              onClick={() => act('PRG_print')}
            >
                Print
            </Button>
          }
        >
          {Object.entries(manifest).map(([department, group]) => (
            <Section key={department} title={<Box>{department}</Box>}>
                <ManifestTable group={group} department={department} />
            </Section>
            ))}
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
