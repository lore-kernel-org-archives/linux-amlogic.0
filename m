From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 2 Jan 2018 22:16:12 +0100
Subject: [RFC v2 1/9] serdev: implement parity configuration
In-Reply-To: <4FDCB65A-641A-4134-BAF1-4A777012FDE7@holtmann.org>
References: <20180101204217.26165-1-martin.blumenstingl@googlemail.com>
 <20180101204217.26165-2-martin.blumenstingl@googlemail.com>
 <4FDCB65A-641A-4134-BAF1-4A777012FDE7@holtmann.org>
Message-ID: <CAFBinCCq9mYBhzoL1XBVQNGxALg8oK5GB7Md9HJf_mchEMu3-A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Marcel, Hi Rob,

On Tue, Jan 2, 2018 at 12:16 PM, Marcel Holtmann <marcel@holtmann.org> wrote:
> Hi Martin,
>
>> Some Bluetooth modules (for example the ones found in Realtek RTL8723BS
>> and RTL8723DS) want to communicate with the host with even parity
>> enabled.
>> Add a new function and the corresponding internal callbacks so parity
>> can be configured. This supports enabling and disabling parity as well
>> as setting the type to odd or even.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>> drivers/tty/serdev/core.c           | 12 ++++++++++++
>> drivers/tty/serdev/serdev-ttyport.c | 21 +++++++++++++++++++++
>> include/linux/serdev.h              |  5 +++++
>> 3 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
>> index 1bef39828ca7..d327b02980f5 100644
>> --- a/drivers/tty/serdev/core.c
>> +++ b/drivers/tty/serdev/core.c
>> @@ -225,6 +225,18 @@ void serdev_device_set_flow_control(struct serdev_device *serdev, bool enable)
>> }
>> EXPORT_SYMBOL_GPL(serdev_device_set_flow_control);
>>
>> +void serdev_device_set_parity(struct serdev_device *serdev, bool enable,
>> +                           bool odd)
>> +{
>> +     struct serdev_controller *ctrl = serdev->ctrl;
>> +
>> +     if (!ctrl || !ctrl->ops->set_parity)
>> +             return;
>> +
>> +     ctrl->ops->set_parity(ctrl, enable, odd);
>> +}
>> +EXPORT_SYMBOL_GPL(serdev_device_set_parity);
>> +
>
> this really needs Rob?s ACK before I take the patch.
sure

I could even live with a NACK in case these two bool parameters are
considered to be ugly
in that case I would propose an enum with three values: DISABLED,
EVEN, ODD so the arguments would look like this:
void serdev_device_set_parity(struct serdev_device *serdev, enum parity)


Regards
Martin
