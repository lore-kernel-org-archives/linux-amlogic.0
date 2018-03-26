From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 26 Mar 2018 22:12:29 +0200
Subject: [PATCH usb-next v1] usb: core: phy: fix return value of
 usb_phy_roothub_exit()
In-Reply-To: <1522035792.3717.183.camel@mhfsdcap03>
References: <20180324135629.31409-1-martin.blumenstingl@googlemail.com>
 <1522035792.3717.183.camel@mhfsdcap03>
Message-ID: <CAFBinCC-nt3oV5sORzedyMO799gWDxw-1YoduACW6n=ckE_twA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Chunfeng,

On Mon, Mar 26, 2018 at 5:43 AM, Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> On Sat, 2018-03-24 at 14:56 +0100, Martin Blumenstingl wrote:
>> usb_phy_roothub_exit() should return the error code from the phy_exit()
>> call if exiting the PHY failed.
>> However, since a wrong variable is used usb_phy_roothub_exit() currently
>> always returns 0, even if one of the phy_exit calls returned an error.
>> Fix this by assigning the error code from phy_exit() to the "ret"
>> variable to propagate the error correctly.
>>
>> Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  drivers/usb/core/phy.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
>> index 09b7c43c0ea4..f19aaa3c899c 100644
>> --- a/drivers/usb/core/phy.c
>> +++ b/drivers/usb/core/phy.c
>> @@ -111,7 +111,7 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub)
>>       list_for_each_entry(roothub_entry, head, list) {
>>               err = phy_exit(roothub_entry->phy);
>>               if (err)
>> -                     ret = ret;
>> +                     ret = err;
> Need break the loop?
in the original implementation I decided not to break the loop here so
phy_exit is called for all PHYs -> only the problematic ones will
remain initialized
(in the _power_on implementation we can try to fix the state by adding
a break and then calling _power_off for all PHYs before the "broken"
one where _power_on failed)

also if phy_exit fails then something is probably very wrong

do you have any specific use-case in mind where the missing break
could be a problem?

>>       }
>>
>>       return ret;
>
>


Regards
Martin
