From: sashal@kernel.org (Sasha Levin)
Date: Thu, 15 Nov 2018 12:39:18 -0500
Subject: [PATCH] clk: meson: axg: mark fdiv2 and fdiv3 as critical
In-Reply-To: <5BEAFF2D.9080105@baylibre.com>
References: <20181108093123.21498-1-jbrunet@baylibre.com>
 <5BEAFF2D.9080105@baylibre.com>
Message-ID: <20181115173918.GI95254@sasha-vm>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Nov 13, 2018 at 05:43:25PM +0100, Neil Armstrong wrote:
>Hi Stable team,
>
>Le 08/11/2018 10:31, Jerome Brunet a ?crit :
>> Similar to gxbb and gxl platforms, axg SCPI Cortex-M co-processor
>> uses the fdiv2 and fdiv3 to, among other things, provide the cpu
>> clock.
>>
>> Until clock hand-off mechanism makes its way to CCF and the generic
>> SCPI claims platform specific clocks, these clocks must be marked as
>> critical to make sure they are never disabled when needed by the
>> co-processor.
>>
>> Fixes: 05f814402d61 ("clk: meson: add fdiv clock gates")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
>Could this fix go into the next 4.18 and 4.19 stable releases since it hit linus master with commit id d6ee1e7e9004d3d246cdfa14196989e0a9466c16 ?

Queued for 4.19 and 4.18, thank you.

--
Thanks,
Sasha
