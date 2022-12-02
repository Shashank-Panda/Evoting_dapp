import React from 'react';
import { Button, Space } from 'antd';

const BasicButtons = () => (
  <Space wrap>
    <Button type="primary">Vote</Button>
    <Button>Add Candidate</Button>
    {/* <Button type="dashed">Dashed Button</Button>
    <Button type="text">Text Button</Button>
    <Button type="link">Link Button</Button> */}
  </Space>
);

export default BasicButtons;