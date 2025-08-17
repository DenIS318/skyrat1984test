import React from 'react';
import { Box, Section, Table } from 'tgui-core/components';
import { decodeHtmlEntities } from 'tgui-core/string';

import { useBackend } from '../backend';
import { COLORS } from '../constants';

const deptCols = COLORS.department;

const HeadRoles: string[] = [
  'Captain',
  'Head of Security',
  'Chief Engineer',
  'Chief Medical Officer',
  'Research Director',
  'Head of Personnel',
  'Quartermaster',
  'Nanotrasen Consultant',
];

// Types for a person in the manifest
export interface Person {
  name: string;
  rank: string;
  active: string;
}

// Type for the manifest object with each department as array of Person
export interface Manifest {
  [departmentName: string]: Person[];
}

// Head colour check
const HCC = (role: string): string => {
  if (HeadRoles.includes(role)) {
    return 'green';
  }
  return 'orange';
};

// Head bold check
const HBC = (role: string): boolean => {
  return HeadRoles.includes(role);
};

export const ManifestTable = ({ group, department }) => {
  if (group.length === 0) return null;

  const deptColor = deptCols[(department ?? '').toLowerCase()] ?? 'transparent';

  return (
    <Table>
      <Table.Row header style={{ backgroundColor: deptColor }} color="white">
        <Table.Cell width="50%">Name</Table.Cell>
        <Table.Cell width="35%">Rank</Table.Cell>
        <Table.Cell width="15%">Active</Table.Cell>
      </Table.Row>
      {group.map((person) => (
        <Table.Row
          color={HCC(person.rank)}
          key={`${person.name}-${person.rank}`}
          bold={HBC(person.rank)}
          style={{ borderLeft: `6px solid ${deptColor}` }} // example styling to highlight dept color per row
        >
          <Table.Cell>{decodeHtmlEntities(person.name)}</Table.Cell>
          <Table.Cell>{decodeHtmlEntities(person.rank)}</Table.Cell>
          <Table.Cell>{person.active}</Table.Cell>
        </Table.Row>
      ))}
    </Table>
  );
};

export const CrewManifestSS1984 = () => {
  const { act, data: backendData } = useBackend<{ manifest: Manifest }>();
  const manifest: Manifest = backendData?.manifest ?? {
    crew: [],
  };

  return (
    <>
      {Object.entries(manifest).map(([department, group]) => (
        <Section key={department} title={<Box>{department}</Box>}>
          <ManifestTable group={group} />
        </Section>
      ))}
    </>
  );
};
