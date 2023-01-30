Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6E4C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feQ4XtHkYny+0l9xLi1A3/ijG3hEABLtCDjXEBphnLo=; b=zfo7G+So0wbU9F
	k6X9TUokAoLv6H8ftZDhNP9YJKG1LEdmS3YankefWxC3cLkNXvtNvHGpgZuQ47drihL/yZDcAchef
	7WnT7QO0vDdNkJn7ZW9MqlXoZM782kJwAZMtPK4YbHFd+a7GBRMy0TrdNeJVkolYz3RPCOfNznI++
	6uwzT2DVCGoFyJjvnUrGofAkJ7HZIrjZIRYXS+qxfecHAFhwEdkF6YSudMjDZX3+CAbLqj+BgXUp6
	681pzoCZ6CP3IUJXLa0L1WL4FRTYx2AchBNKMMyZM41RREvQ29GjwqQWzHoqbJdLuUONqSZOIdR63
	898ODgC6YlAZXIeJ7Ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQp9-002yWr-Fv; Mon, 30 Jan 2023 09:51:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQoR-002yQj-P4
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 09:50:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id k16so7551323wms.2
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 01:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpw0PlvU/+G3/AbOY+LmAHVcN3lWBOIxI7cN0V/UDVA=;
        b=h82BWsutbbUIKXsH/3YncLuOYd3bwt2KXgv++28nnYdCR1GbVtpJvLkis3WXCtMYTU
         CV+8xGJhqF9RgN6pcbWClcovF3FZs0V7mqNwt4hM44hRnXzMxynPA1fjKFKnf8h52qOX
         6HPu2AAMnUBRJW34NGWiPJHI9xvgqU9eoC8yuIhB88HUO/iheNMHTFVLWvoNKg8X9lKc
         oFH1VAjUkm6VLV0FJpAkeFFauhnesHzbUPHcT8B6xU2gsaqKMZqi1nMEHlQlDlni+M6y
         wOWlmK6w2Xyjj72ILxbvo8luR4yw4LgFoZ7pjwUyogOu/MFseX4yhoRcY7+wNP1zyAEj
         y7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tpw0PlvU/+G3/AbOY+LmAHVcN3lWBOIxI7cN0V/UDVA=;
        b=269hRdLQpji+Wu2ZAFoL1mV/YnwOtnrr6iRs60I+YAyMQ3UJP/FX4Q1xwyF1yPpJ20
         OizVHRgREAxYlay89s/Z5/eMzXUuqkxnYY85hI+tRw6j9sz5kSWUz/Ua4BWmgjWzWarC
         SZgoir8sEls6nQGFX8uEvl/00POorCPbkOuFE9f8TnXU39elhXJkUx+43Xk1qJJxGDLp
         ujvj0zP2giDSXqzKWN0UD5NZ99+PgpJW69lXyUuvNvUPcV5jXNQEp0XROKTJFlYpyevV
         eUFbhdxxqgPiQ+s+NULIuKgEAfwtvquYKmwTdQI1OFEWbwi1iPYGJRF9WhsyYar2wKHO
         PIuA==
X-Gm-Message-State: AFqh2kotg4KSkdOjVzl+1QlJJt9qJZNFomAlNEZt72hvhc5qVydLn5Ki
	YEHtVh9/OHheE7IZwX/v1a7DHQ==
X-Google-Smtp-Source: AMrXdXty/CzopwFwFNA46HfW4nEHg4fXkhUd7YpiCqaPcpsB4N8Ar9Le/a46P2MQpwUdKi9Uo2zL1Q==
X-Received: by 2002:a7b:cc07:0:b0:3da:fcb7:39e5 with SMTP id f7-20020a7bcc07000000b003dafcb739e5mr47379046wmh.23.1675072253184;
        Mon, 30 Jan 2023 01:50:53 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c028200b003dc4baaedd3sm6725641wmk.37.2023.01.30.01.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:50:52 -0800 (PST)
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-4-yu.tu@amlogic.com>
 <1ja62eybrv.fsf@starbuckisacylon.baylibre.com>
 <aedb0764-b5cb-7f49-f279-51dbec070e80@amlogic.com>
 <1jwn5hwn0w.fsf@starbuckisacylon.baylibre.com>
 <a4ad6ac6-60c2-8f7b-fdb0-509de31db282@amlogic.com>
 <1jy1pko0fc.fsf@starbuckisacylon.baylibre.com>
 <e2e9045a-6e35-112f-69a7-15b080571b69@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
  Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
 <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 3/3] clk: meson: s4: add support for Amlogic S4 SoC
 peripheral clock controller
Date: Mon, 30 Jan 2023 10:47:04 +0100
In-reply-to: <e2e9045a-6e35-112f-69a7-15b080571b69@amlogic.com>
Message-ID: <1jr0vcnyf7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_015055_821744_8443723E 
X-CRM114-Status: GOOD (  20.88  )
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


On Mon 30 Jan 2023 at 17:41, Yu Tu <yu.tu@amlogic.com> wrote:

> On 2023/1/30 17:06, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Sat 28 Jan 2023 at 18:17, Yu Tu <yu.tu@amlogic.com> wrote:
>> 
>>> On 2023/1/20 17:47, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>> On Fri 20 Jan 2023 at 11:33, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>
>>>>> Hi
>>>>> On 2023/1/19 19:37, Jerome Brunet wrote:
>>>>>> [ EXTERNAL EMAIL ]
>>>>>> On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>>>
>>>>>>> Add the peripherals clock controller driver in the s4 SoC family.
>>>>>>>
>>>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>>>> [...]
>>>>>>
>>>>>>> +
>>>>>>> +/* Video Clocks */
>>>>>>> +static struct clk_regmap s4_vid_pll_div = {
>>>>>>> +	.data = &(struct meson_vid_pll_div_data){
>>>>>>> +		.val = {
>>>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>>>> +			.shift   = 0,
>>>>>>> +			.width   = 15,
>>>>>>> +		},
>>>>>>> +		.sel = {
>>>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>>>> +			.shift   = 16,
>>>>>>> +			.width   = 2,
>>>>>>> +		},
>>>>>>> +	},
>>>>>>> +	.hw.init = &(struct clk_init_data) {
>>>>>>> +		.name = "vid_pll_div",
>>>>>>> +		/*
>>>>>>> +		 * The frequency division from the hdmi_pll clock to the vid_pll_div
>>>>>>> +		 * clock is the default value of this register. When designing the
>>>>>>> +		 * video module of the chip, a default value that can meet the
>>>>>>> +		 * requirements of the video module will be solidified according
>>>>>>> +		 * to the usage requirements of the chip, so as to facilitate chip
>>>>>>> +		 * simulation. So this is ro_ops.
>>>>>>> +		 * It is important to note that this clock is not used on this
>>>>>>> +		 * chip and is described only for the integrity of the clock tree.
>>>>>>> +		 */
>>>>>> If it is reset value and will be applicable to all the design, regarless
>>>>>> of the use-case, then yes RO ops is OK
>>>>>>
>>>>>> >From what I understand here, the value will depend on the use-case requirements.
>>>>>> This is a typical case where the DT prop "assigned-rate" should be used, not RO ops.
>>>>>
>>>>> Check the previous chip history, the actual scene is not used at all,
>>>>> basically is used in simulation. So the previous SOC was "ro_ops" without
>>>>> any problems.  This S4 SOC is not actually useful either.
>>>>>
>>>>> So when you were upstream, you had no problem making "ro_ops". I wonder if
>>>>> I could delete this useless clock, so you don't have to worry about it.
>>>> I don't know what to make of this. What is the point of adding a useless
>>>> clock ?
>>>
>>> As explained earlier this "vid_pll_div" is actually used in chip
>>> emulation. So next I'd like to know what you suggest to do with the clock?
>>>
>> If it does not exist in the actual SoC, please remove it
>> 
>
> If I remove it, the "vid_pll_sel" clock will be missing a parent
> (vid_pll_div). I will use the table method and give the above reasons. Do
> you accept this method?

Either the clock exists or it does not.

If the HW actually exist, it is expected to be properly described.
If it does not, it obviously cannot be an input to another clock.

Please sort this out and make the necessary changes.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
