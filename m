From: serveralex@gmail.com (=?utf-8?Q?Alexander_M=C3=BCller?=)
Date: Wed, 13 Jul 2016 19:53:12 +0200
Subject: [PATCH 7/7] arm: amlogic: select meson8b clk driver
In-Reply-To: <m2inwiqwaa.fsf@baylibre.com>
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-8-git-send-email-serveralex@gmail.com>
 <146776648028.35356.7816151912503029258@resonance>
 <m2inwiqwaa.fsf@baylibre.com>
Message-ID: <41983A35-37D0-40D0-BFD2-1EF7DC655B93@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Kevin, 

I did the proposed changes and rebased to integ. 

Please review and let me know if I missed something.

Alex

> On 06 Jul 2016, at 23:41, Kevin Hilman <khilman@baylibre.com> wrote:
> 
> Michael Turquette <mturquette@baylibre.com> writes:
> 
>> Hi Alex,
>> 
>> Quoting Alexander M?ller (2016-07-05 10:56:31)
>>> Select the Amlogic clk code for meson SoCs and the more specific meson8b clk
>>> driver for Amlogic meson8b.
>>> 
>>> Signed-off-by: Alexander M?ller <serveralex@gmail.com>
>> 
>> This patch isn't necessary as an alternative is already queued. See:
>> https://git.kernel.org/cgit/linux/kernel/git/mturquette/linux.git/commit/?h=gxbb-dt-clk&id=bae5d70ba6f8726ea6306aa07b7d2eb4357d3c81
>> 
>> However, if you're basing on top of clk-next (or clk-s905) then you
>> won't see the three patches linked above because they are queued through
>> Kevin & Carlo via the amlogic tree.
> 
> ...which you can find here[1] and specifically, the "integ" branch where
> I'm keeping the latest queued versions of various things merged together
> for easier testing.
> 
> Kevin
> 
> [1] https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git/
