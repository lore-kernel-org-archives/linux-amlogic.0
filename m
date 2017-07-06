From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 6 Jul 2017 13:55:58 +0200
Subject: [PATCH] drm/bridge: dw_hdmi: add cec notifier support
In-Reply-To: <20170706114555.GK4902@n2100.armlinux.org.uk>
References: <1499337186-24429-1-git-send-email-narmstrong@baylibre.com>
 <20170706110553.GJ4902@n2100.armlinux.org.uk>
 <185aa90b-a1b2-d899-40bb-7d333f584bb5@baylibre.com>
 <20170706114555.GK4902@n2100.armlinux.org.uk>
Message-ID: <dc03b967-9d59-48c2-3365-0dc54ba4a891@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 07/06/2017 01:45 PM, Russell King - ARM Linux wrote:
> On Thu, Jul 06, 2017 at 01:29:54PM +0200, Neil Armstrong wrote:
>> On 07/06/2017 01:05 PM, Russell King - ARM Linux wrote:
>>> On Thu, Jul 06, 2017 at 12:33:06PM +0200, Neil Armstrong wrote:
>>>> From: Russell King <rmk+kernel@armlinux.org.uk>
>>>>
>>>> Add CEC notifier support to the HDMI bridge driver, so that the CEC
>>>> part of the IP can receive its physical address.
>>>>
>>>> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
>>>> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> ---
>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 18 ++++++++++++++++++
>>>>  1 file changed, 18 insertions(+)
>>>>
>>>> Hi Archit, Hans,
>>>>
>>>> This is repost of Russell's patch from his dw-hdmi CEC patchset.
>>>>
>>>> Since his CEC implementation will be integrated in the bridge driver,
>>>> this notifier patch won't be re-posted.
>>>>
>>>> But the Amlogic Platform needs a notifier since it uses a standalone CEC
>>>> controller.
>>>
>>> Without this, the dw-hdmi CEC support will be totally useless anyway,
>>> and it's pointless to merge it without this patch.
>>>
>>
>> Hi Russell,
>>
>> While following discussion on your last patchset, it seems you agreed with Hans
>> to no more rely on the cec-notifier but directly call the dw-hdmi-cec functions.
> 
> Incorrect.  I think you're looking at the discussion in "thread mode"
> and assuming that messages are stored in date order...
> 
> There was a discussion about removing the cec-notifier which happened
> on June 1st/2nd, based off the covering email.
> 
> However, there was a later discussion on June 9th (sparked by your
> requirement) which changed the resolution from "lets remove the
> notifier" to "we need to keep the notifier".  This was based on
> patch 2/4.
> 
> I never posted an updated patch set, because of the dependencies, but
> Hans decided on June 12th to do I-don't-know-what with the patches I
> sent, resulting in what we have queued up today.  This brought the
> sub-thread containing the cec-notifier removal discussion to be _after_
> the June 9th discussion, which is probably what's causing some
> confusion here.
> 
> However, I can assure you that the resolution of the discussion with
> the cec-notifier was that it should remain in place - this is from
> the last few messages in the discussion:
> 
> Hans wrote on 9th June:
> | You wrote on 9th June:
> | > It won't since the Meson platform needs it...
> |
> | Ah, I wasn't aware of that when I wrote my original comments. In that case
> | we do need the notifier. Which is fine, as long as the reason for that is
> | documented.
> 
> From what you're saying, it sounds like the CEC dw-hdmi-cec.c still
> relies on the notifier, but the patch which adds the CEC notifier
> to dw-hdmi.c was omited from what Hans did, which will result in the
> whole thing being a total waste of time.
> 
>> Anyway, if this patch is merged separately and you still depend on it,
>> you could still rebase on it when it appears on drm-misc-next...
> 
> Well, from what I can see in 4.12, the cec-notifier stuff is rather
> broken (tda998x has stopped working as its stuck with a physical
> address of f.f.f.f) so I think the whole thing is rather moot right
> now.  I don't yet know what's going on with that, other than the
> notifier stuff seems to not be working, despite being enabled in
> the .config.
> 

Indeed, I missed some parts of the thread, sorry for the confusion.

Anyway, is it a showstopper to have this patch merged separately ?

If you prefer re-posting a serie with this patch inside, no problem,
but the Amlogic platform still needs this patch to have CEC working.

Maybe it's because of fixes introduced in 4.13, but using next-20170706
and this patch, make things works perfectly.

Neil
