import { Box, Section, Stack, Input } from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

export class EventOutfitEditor1984 extends Component {
    constructor(props) {
        super(props);
        // todo: serialize it as well
        this.typePathsMap = []
    }
    componentDidMount() {
        const { act, data } = useBackend();
        const { outfit, extra_data_1984} = data;
    }
    render() {
        return (
            <Window width={380} height={600} theme="admin">
            <Window.Content>
                <Stack vertical={true}>
                    <Button
                        icon="save"
                        tooltip="Click to save traits & abilities to outfit"
                        tooltipPosition="bottom-start"
                        onClick={() => act('update')}
                    />
                    <Section fill scrollable>
                        <Input
                        fluid
                        maxLength={1025}
                        mt={1}
                        onEnter={(value) => {

                        }}
                        placeholder="Enter a new description"
                    />
                    </Section>
                </Stack>
            </Window.Content>
            </Window>
        );
    }
}
