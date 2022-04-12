import React, { createElement } from 'react'
import { STOPPED_STATUS, STOPPING_STATUS, INSTALLING_STATUS, RUNNING_STATUS, KILLING_STATUS } from 'constants/serverStatuses'
import Box from '@material-ui/core/Box'
import StatusOption from 'components/StatusOption'
import List from '@material-ui/core/List'
import ListItem from '@material-ui/core/ListItem'
import ListItemText from '@material-ui/core/ListItemText'
import ListItemIcon from '@material-ui/core/ListItemIcon'
import InfoIcon from '@material-ui/icons/Info'
import ErrorIcon from '@material-ui/icons/Error'
import CheckCircleIcon from '@material-ui/icons/CheckCircle'

export default ({ serverState }) => {
  const statusText = {
    [STOPPED_STATUS]: 'Stopped',
    [STOPPING_STATUS]: 'Stopping',
    [INSTALLING_STATUS]: 'Installing / updating',
    [RUNNING_STATUS]: 'Running',
    [KILLING_STATUS]: 'Killing',
  }[serverState.Status]

  const color = {
    [STOPPED_STATUS]: 'error.main',
    [STOPPING_STATUS]: 'warning.main',
    [INSTALLING_STATUS]: 'warning.main',
    [RUNNING_STATUS]: 'success.main',
    [KILLING_STATUS]: 'warning.main',
  }[serverState.Status]

  const icon = {
    [STOPPED_STATUS]: ErrorIcon,
    [STOPPING_STATUS]: InfoIcon,
    [INSTALLING_STATUS]: InfoIcon,
    [RUNNING_STATUS]: CheckCircleIcon,
    [KILLING_STATUS]: InfoIcon,
  }[serverState.Status]

  return (
    <List>
      <Box color={color}>
        <ListItem>
          <ListItemIcon style={{ color: 'inherit' }}>
            {createElement(icon)}
          </ListItemIcon>
          <ListItemText primary={statusText} />
        </ListItem>
      </Box>
      <ListItem>
        <ListItemText inset>
          <StatusOption title="Name" value={serverState.Options.Name} />
          <StatusOption title="World" value={serverState.Options.World} />
          <StatusOption title="Password" value={serverState.Options.Password} />
          <StatusOption title="Public" value={serverState.Options.Public && 'Yes'} />
        </ListItemText>
      </ListItem>
    </List>
  )
}
