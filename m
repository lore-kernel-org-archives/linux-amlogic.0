From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 21 Nov 2016 12:15:21 -0800
Subject: [PATCH 3/3] ARM64: dts: meson-gxbb: add the USB reset also to the
 second USB PHY
In-Reply-To: <CAFBinCBVaQ7SLwQ0M2eJj0iyQuErF1Ev5dtGzKr7itiesy11MQ@mail.gmail.com>
 (Martin Blumenstingl's message of "Fri, 18 Nov 2016 23:35:19 +0100")
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-4-martin.blumenstingl@googlemail.com>
 <m2twb7w1j6.fsf@baylibre.com>
 <CAFBinCBVaQ7SLwQ0M2eJj0iyQuErF1Ev5dtGzKr7itiesy11MQ@mail.gmail.com>
Message-ID: <m2eg2437za.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Kevin,
>
> On Wed, Nov 16, 2016 at 10:35 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>
>>> When the USB PHY driver was introduced the reset framework did not
>>> have support for triggering a reset pulse for shared resets. On GXBB
>>> however there is only one reset line for both PHYs (meaning we have a
>>> shared reset line). With the latest changes to the reset framework and
>>> the corresponding updates to the phy-meson8b-usb2 driver we can now pass
>>> the reset to the second PHY as well.
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> Applied.
> Unfortunately I think I put crucial information only in the
> cover-letter's description:
> "the dts patch has a runtime-dependency on patch 1 and 2"

I saw that, but also see that both of those have been queued, so should
land in v4.10 also.

> So please feel free to keep or drop the patch as it is. In case you
> decide drop it I will re-send it for 4.11 (after all the 4.10 stuff is
> done).

IMO, it's fine to keep it.  That means there may be some versions of
linux-next that have the problem where the reset will get asserted
twice, but since that is affecting very few people (probably only you),
I think it's OK, since it will be fine once v4.10-rc1 is released.

If you don't want that, let me know and I'll drop it for now.

Kevin
