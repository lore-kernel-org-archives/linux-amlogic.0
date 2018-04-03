From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Tue, 3 Apr 2018 10:27:01 +0200
Subject: [PATCHv2 1/3] dt-bindings: display: dw_hdmi.txt: add cec-disable
 property
In-Reply-To: <20180326072830.iphtbw5mkeciv4kj@rob-hp-laptop>
References: <20180323125915.13986-1-hverkuil@xs4all.nl>
 <20180323125915.13986-2-hverkuil@xs4all.nl>
 <20180326072830.iphtbw5mkeciv4kj@rob-hp-laptop>
Message-ID: <05e7ade1-89be-0f0f-18a5-88ff0310a70b@xs4all.nl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 27/03/18 00:25, Rob Herring wrote:
> On Fri, Mar 23, 2018 at 01:59:13PM +0100, Hans Verkuil wrote:
>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>
>> Some boards have both a DesignWare and their own CEC controller.
>> The CEC pin is only hooked up to their own CEC controller and not
>> to the DW controller.
>>
>> Add the cec-disable property to disable the DW CEC controller.
>>
>> This particular situation happens on Amlogic boards that have their
>> own meson CEC controller.
> 
> Seems like we could avoid this by describing how the CEC line is hooked 
> up which could be needed for other reasons.

So there are three situations:

1) The cec pin is connected to the DW HDMI TX. That's already supported.
2) The cec pin is not connected at all, but the CEC IP is instantiated.
   We need the cec-disable property for that. This simply states that the
   CEC pin is not connected.
3) The cec pin is connected to an HDMI RX. We do not support this at the
   moment. If we want to support this, then we need a 'hdmi-rx' phandle
   that points to the HDMI receiver that the CEC pin is associated with.
   This will be similar to the already existing 'hdmi-phandle' property
   used to associate a CEC driver with an HDMI transmitter. In hindsight
   it would have been better if 'hdmi-phandle' was named 'hdmi-tx' :-(

I can make a binding proposal for 3, but I have no hardware to test it,
so I think it is better to add this only when someone has hardware. It
will require quite a few changes to the driver and likely also the CEC core.

Regards,

	Hans

> 
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt | 3 +++
>>  1 file changed, 3 insertions(+)
