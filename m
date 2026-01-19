Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DE2D29C2A
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jan 2026 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbxvOT+SE+n8DERZc632avwg8Fe8pExf4og+1AUGito=; b=3CMQJg51uNc/rW
	0iJu9pvtjFqzCGzm52JN/QaoUxgd1zvqH9tk/Uxrffn4ZEsrIe0shdp3fwVqQEcNafHGUBeQU4K/f
	Wf81ZRHko+icMlh8uYxsXUWNnphdlNr7hX0h4SO5X6M/rYMXWBP3mrnQUq9YcAPsS90/+3WCf23k0
	YgQ9vcjcPKKV6j5+eh5f5n+1hQv2RJE+LNwZSslPHa/vqMeJ0wyedaK6zpii3py5ZU3dJpxH54o4s
	b49+pd4tsHWVg4aBlW3rUigmXGdCFqszB8sl/o/Q+vhOTsHENOhO0Hnt+O9FEanac8OMJKPTUnAgt
	MJ5ggh0qGjr1vlpT+TcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpHp-00000002AT7-40bW;
	Mon, 19 Jan 2026 13:27:17 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpHm-00000002ARP-0ufe
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jan 2026 13:27:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso28759855e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jan 2026 05:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768829232; x=1769434032; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eCbuiYjGuVvlbB4vqWDSqvvIfZr+F+0/4EzDwihuPK4=;
        b=0hVy8FQ9QvjPHseY9OY1x/g9Sueefj09qf28tVdyKuMQSKp6UStK/ABdel/eKmn5gL
         R4O4KRgF7MwgUdjFzJCDPs+UvA0Kc07WGn2d+R8BMOgBof67/sJ6W77OUPNP6JqWp9P6
         e3yrFV5D+uAX1VhrJNZUjVdctu+Izja8mngxSAb0qTgJmQSxeeLuWOyH/KAaeYSGQik1
         RzsbmV6mwrgRX5sUNQ2BLTWFPT5Yw/QToBcCQJQzLOef74czs2mAgbE6WL9wLJ9CXJ2G
         tBL9l5cbeNxiPqEtC5awKLWP4L95G8DmTICbvYZI9vqqSgIQrwkspBwyd0C4x5xdeynb
         zrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768829232; x=1769434032;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eCbuiYjGuVvlbB4vqWDSqvvIfZr+F+0/4EzDwihuPK4=;
        b=Bb/1AQQctKPf+jaM6NXsiyfmIvBYcU9L/63JrulhSfli9/e+9RHjm7+nqRedWrz05f
         lq8z1RJJ1PgvcAplGpi8cHDjcGil4MsM9pva+5Fh2RBVceh+vDYimJPq+T3cgaFowGOR
         zd84/Mhj/Zr13XOBsXOHRze3xv76lo+YpS6PrL7Qk0aHHvPHk02XMW9hiGFzdQphwQgn
         GdUd9UAjNtkeOx1JvQSituyyCpDDF39S2cXE3SSr0Pbf/5yM5WKcaAL/GzmYYj50Kd5M
         Zx0Trih8P1MvAJtpGcYG+HBKTOCK8HMJubYH9/j/rnWbnplguFbE4zOVriP1tABPNlUk
         RykQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAgqJkECw/unnlFxx76x7Od53uP9kYzN0b6oNIN7CdHNqo3DeQPwpPEXCZUgPH8PRi/qYUkHvwweklZsaT@lists.infradead.org
X-Gm-Message-State: AOJu0YzxxFofnq4jUlNZZ0wf6hacbyewBuwF4pZ+4ac0Iqz4JJjjZuq7
	oZovgfJzCZ6xAf3DFvbqJD8VasXd9EmaCq8Sre4x4IxZGcrTFjT0sX1rfoczPBS+aA8=
X-Gm-Gg: AY/fxX4XcMdOc8Zltgy8Ayp37zkvpEC3acJRbrJ2pGUmdOivHXZCxiaFxMbcXow06y9
	t9uRgHO0lZ4czAswf0ylsIFWMM0wtNlQeOQ0oG0Scz1JVU6TXoTJISwLW4Al5X0LtbJT9Z9V6Uq
	5Ftm6K7af7OOknbaX/J0SLErxM/fWTlPg6OgYjtm87XyY0nMyix8vckIqraZ5w8EVnonELlAUi8
	I4YCc7ynsD/Iu0QQxLjoTgvp+KfFDGNyE/c4IH3hhMHM+zZRa39xJl6+RQR6o8eWE282AQCE+9m
	FVF/CncODnrazibIAl/l3hWl7yDbjwLBffc/1bXpaFEj4Dy1uxXfZ7+NattX+nE3Kis26M3SSaq
	v3Le3VZAtcbzaPkxmF4fBvgHollY39ONqpwW6Xa3IRT/SC7of21maeqioBJPggINSLk/YsbhWVv
	tb8kfhjQtR2A==
X-Received: by 2002:a05:600c:8b67:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-4801e342091mr114088625e9.23.1768829231748;
        Mon, 19 Jan 2026 05:27:11 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4154:6ad6:c781:df9c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4801e8c0499sm197706815e9.9.2026.01.19.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:27:11 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/8] clk: amlogic: Add A5 clock peripherals
 controller driver
In-Reply-To: <ea7e209d-cd30-4d93-9deb-104aaf7c92eb@amlogic.com> (Chuan Liu's
	message of "Mon, 19 Jan 2026 20:16:19 +0800")
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
	<20260108-a5-clk-v5-5-9a69fc1ef00a@amlogic.com>
	<1jecnsr1eg.fsf@starbuckisacylon.baylibre.com>
	<ea7e209d-cd30-4d93-9deb-104aaf7c92eb@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 19 Jan 2026 14:27:09 +0100
Message-ID: <1jbjipviky.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_052714_730778_0F6F3B32 
X-CRM114-Status: GOOD (  20.64  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On lun. 19 janv. 2026 at 20:16, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome,
>
> On 1/14/2026 5:25 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On jeu. 08 janv. 2026 at 14:08, Chuan Liu via B4 Relay
>> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>> 
>>> +static struct clk_regmap a5_rtc_clk = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = RTC_CTRL,
>>> +             .mask = 0x3,
>>> +             .shift = 0,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "rtc_clk",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = a5_rtc_clk_parents,
>>> +             .num_parents = ARRAY_SIZE(a5_rtc_clk_parents),
>>> +             .flags = CLK_SET_RATE_NO_REPARENT,
>>> +     },
>>> +};
>>> +
>>> +#define A5_PCLK(_name, _reg, _bit, _pdata, _flags)                   \
>>> +struct clk_regmap a5_##_name = {                                     \
>>> +     .data = &(struct clk_regmap_gate_data) {                        \
>>> +             .offset = (_reg),                                       \
>>> +             .bit_idx = (_bit),                                      \
>>> +     },                                                              \
>>> +     .hw.init = &(struct clk_init_data) {                            \
>>> +             .name = #_name,                                         \
>>> +             .ops = &clk_regmap_gate_ops,                            \
>>> +             .parent_data = (_pdata),                                \
>>> +             .num_parents = 1,                                       \
>>> +             .flags = (_flags),                                      \
>>> +     },                                                              \
>>> +}
>> I wonder why I bothered reviewing v4 ...
>
> Regarding the comment you made on V4, my understanding is that you were
> just teasing ...

You are redefining the PCLK here, the *exact* type of pointless differences
we've worked last year to remove. This is something you can't have
missed since you've complained about it taking too long.

And now, you've thought I was "just teasing" about it ?

I'm bored with your botched submissions Chuan.

> In the next revision, I will change this part to use a
> unified macro.

Yes please.

>
> We may also consider adjusting the "MESON_PCLK" macro later by removing the
> SoC prefix from the clock name,

No

> so that it is consistent with the naming
> style used by "MESON_COMP_SEL" / "MESON_COMP_DIV".
>

Just do the same as c3 and t7.

>> 
>>> +
>>> +static const struct clk_parent_data a5_sys_pclk_parents = { .fw_name = "sysclk" };
>>> +
>>> +#define A5_SYS_PCLK(_name, _reg, _bit, _flags) \
>>> +     A5_PCLK(_name, _reg, _bit, &a5_sys_pclk_parents, _flags)
>>> +
>>> +static A5_SYS_PCLK(sys_reset_ctrl,   SYS_CLK_EN0_REG0, 1, 0);
>>> +static A5_SYS_PCLK(sys_pwr_ctrl,     SYS_CLK_EN0_REG0, 3, 0);
>>> +static A5_SYS_PCLK(sys_pad_ctrl,     SYS_CLK_EN0_REG0, 4, 0);
>>> +static A5_SYS_PCLK(sys_ctrl,         SYS_CLK_EN0_REG0, 5, 0);
>>> +static A5_SYS_PCLK(sys_ts_pll,               SYS_CLK_EN0_REG0, 6, 0);
>>> +
>>>
>> [...]
>> 
>>> +
>>> +static struct clk_regmap a5_gen = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = GEN_CLK_CTRL,
>>> +             .bit_idx = 11,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "gen",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &a5_gen_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +#define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
>>> +     MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
>>> +
>>> +#define A5_COMP_DIV(_name, _reg, _shift, _width) \
>>> +     MESON_COMP_DIV(a5_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>>> +
>>> +#define A5_COMP_GATE(_name, _reg, _bit, _iflags) \
>>> +     MESON_COMP_GATE(a5_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))
>>> +
>> At the top. like C3 and T7
>
> Except for A5_COMP_SEL, which differs slightly from T7 due to the
> additional "_table" parameter, the other macros are consistent with T7.
>
> I also asked for your feedback on this in V4 and received your
> confirmation. Is there anything here that still needs to be updated?

Reviewing these long patches takes time. I tend to stop reviewing when I
noticed some feedback was ignored, especially when it is recurrent
problem. I've told you that already. It is up to you to make sure you are
not missing anything before re-submitting if you don't want to waste time.

>
> [...]

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
