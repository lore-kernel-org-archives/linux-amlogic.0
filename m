From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Tue, 12 Jul 2016 17:45:22 +0100
Subject: [PATCH v3 0/2] AMLogic Meson SoC RTC driver
In-Reply-To: <7hinwg85k7.fsf@baylibre.com>
References: <1467748089-14718-1-git-send-email-ben.dooks@codethink.co.uk>
 <7hinwg85k7.fsf@baylibre.com>
Message-ID: <53016146-6647-224c-ba1a-f2a9dc364a86@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 08/07/16 17:20, Kevin Hilman wrote:
> Ben Dooks <ben.dooks@codethink.co.uk> writes:
> 
>> This series adds support for the on SoC RTC driver on the
>> AMLogic Meson devices.
> 
> -ECONFUSED
> 
> In reply to this patch, there are two other "PATCH v3 0/2" replies, an
> then the two patches themselves, have "PATCH n/4" subjects when one
> would expect "PATCH n/2" subjects.

This was my mistake of formatting the patch then thinking it would
be easy to remove the other two patches I decided to keep separate
(for reasons below)

> Anyways, I was able to test this version with the DTs from the previous
> version, and it works ok.

Yes, no changes for the DT bits so I decided to remove them as firstly
they depend on the reset-controller changes going in and secondly
the rtc driver part doesn't need them to be there to be able to build.

> Can you respin one more time (including the Tested-by) so the RTC
> maintainers can pick it up?

I'll do that now and try and post them tonight.
Thankyou for testing.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
