From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 27 Nov 2018 14:58:21 +0100
Subject: [PATCH u-boot v3 1/3] regmap: add regmap_read_poll_timeout()
 helper
In-Reply-To: <CAPnjgZ1c2CMTy7H1bt_Dh6MWEiyvTkoDvqHC3H3YbqiQoxOqnQ@mail.gmail.com>
References: <20181122100105.14829-1-narmstrong@baylibre.com>
 <20181122100105.14829-2-narmstrong@baylibre.com>
 <CAPnjgZ1c2CMTy7H1bt_Dh6MWEiyvTkoDvqHC3H3YbqiQoxOqnQ@mail.gmail.com>
Message-ID: <383003ad-53ac-9a5e-7acc-9aa80e73b13c@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Simon,

On 27/11/2018 02:02, Simon Glass wrote:
> Hi Neil,
> 
> On Thu, 22 Nov 2018 at 03:01, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Add the regmap_read_poll_timeout() macro based on the Linux implementation
>> to simplify register polling with configurable timeout and sleep.
>>
>> Acked-by: Jagan Teki <jagan@openedev.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  include/regmap.h | 38 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
> 
> Is there a change log somewhere? This is v3.

Forgot changelog on cover letter, v3 only changes the SPI driver, the regmap patches are only rebased against master.

Neil

> 
> Regards,
> Simon
> 
