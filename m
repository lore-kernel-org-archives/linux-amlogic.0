From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 31 Jul 2017 10:10:55 +0200
Subject: [PATCH v2 4/4] clk: meson: gxbb-aoclk: Add CEC 32k clock
In-Reply-To: <389b0cd5-4c93-e043-9c55-02bd56f590cf@free.fr>
References: <1501235589-318-1-git-send-email-narmstrong@baylibre.com>
 <1501235589-318-5-git-send-email-narmstrong@baylibre.com>
 <389b0cd5-4c93-e043-9c55-02bd56f590cf@free.fr>
Message-ID: <85e100a8-2c83-b153-51fd-dcc80698c685@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

On 07/29/2017 10:04 AM, Chris Moore wrote:
> Hi,
> 
> Sorry I forgot to reply to all in my previous post :(
> I hope this corrects things.
> 
> Le 28/07/2017 ? 11:53, Neil Armstrong a ?crit :
> 
> [snip]
> 
>> +static long aoclk_cec_32k_round_rate(struct clk_hw *hw, unsigned long rate,
>> +                     unsigned long *prate)
>> +{
>> +    const struct cec_32k_freq_table *freq = find_cec_32k_freq(rate,
>> +                                  *prate);
>> +
>> +    /* If invalid return first one */
>> +    if (!freq)
>> +        return freq[0].target_rate;
> 
> Wouldn't this dereference a null pointer (or am I being stupid this morning)?

No, it's me !!
Will fix it in v3...

> 
>> +
>> +    return freq->target_rate;
>> +}
>> +
>> +static int aoclk_cec_32k_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                  unsigned long parent_rate)
>> +{
>> +    const struct cec_32k_freq_table *freq = find_cec_32k_freq(rate,
>> +                                  parent_rate);
>> +    struct aoclk_cec_32k *cec_32k = to_aoclk_cec_32k(hw);
>> +    u32 reg = 0;
>> +
>> +    if (!freq)
>> +        return -EINVAL;
>> +
>> +    /* Disable clock */
>> +    regmap_update_bits(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL0,
>> +               CLK_CNTL0_IN_GATE_EN | CLK_CNTL0_OUT_GATE_EN, 0);
>> +
>> +    if (freq->dualdiv)
>> +        reg = CLK_CNTL0_DUALDIV_EN |
>> +              FIELD_PREP(CLK_CNTL0_N1_MASK, freq->n1 - 1) |
>> +              FIELD_PREP(CLK_CNTL0_N2_MASK, freq->n2 - 1);
>> +    else
>> +        reg = FIELD_PREP(CLK_CNTL0_N1_MASK, freq->n1 - 1);
>> +
> 
> Suggestion:
> 
> +    reg = FIELD_PREP(CLK_CNTL0_N1_MASK, freq->n1 - 1);
> +    if (freq->dualdiv)
> +        reg |= CLK_CNTL0_DUALDIV_EN |
> +               FIELD_PREP(CLK_CNTL0_N2_MASK, freq->n2 - 1);
> 
> is shorter but maybe generates the same code.
> 
>> + regmap_write(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL0, reg);
>> +
>> +    if (freq->dualdiv)
>> +        reg = FIELD_PREP(CLK_CNTL1_M1_MASK, freq->m1 - 1) |
>> +              FIELD_PREP(CLK_CNTL1_M2_MASK, freq->m2 - 1);
>> +    else
>> +        reg = FIELD_PREP(CLK_CNTL1_M1_MASK, freq->m1 - 1);
>> +
> 
> Idem:
> 
> +    reg = FIELD_PREP(CLK_CNTL1_M1_MASK, freq->m1 - 1);
> +    if (freq->dualdiv)
> +        reg |= FIELD_PREP(CLK_CNTL1_M2_MASK, freq->m2 - 1);
>

Thanks for the suggestions, I will send a v3 asap.

Neil
> Cheers,
> Chris
