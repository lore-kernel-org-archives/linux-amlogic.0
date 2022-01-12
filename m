Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51E9C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3luSA+qKxJYIB4ymtaQYYkKbuWmXw33096ovoLpNYyI=; b=Xop6isV7tUkDIKgdEeOdNkZcKU
	/0S+axQqQxPK8R2n2qFhqwSsfpW1b5rpDOVSxAB7bRQiuJVcdJMvgbryC7KGaMN8sprNZHtk62rJO
	8YE5b7GMC0lTUmLWwWI6X+Jun6TeIpSbB8YhrmFS1d3X8Unis0gDSq6Aa/jmfnKOVt/7/AFZVFb9f
	DIAkow6aGUHecOoGpSYm6C/rZVUidx1hTkaHhyfQ/19s3CpSjQnBzcG1bom9dI+bUFT1Vz/oWIJby
	xHzrlfcsNRlqL794vqn+HAW40gSzrEyDbHPGc+gkC428Ih63HwZ51HL+4iWB6SD9Y8cfycw3Bc0iY
	XCYvH/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Z7M-001ZMi-FG; Wed, 12 Jan 2022 08:36:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Z7J-001ZKy-OC
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:36:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so1096708wme.0
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1E2KjRoh5QPl4QWMlc2IUWvkR+6ixdGn9JSrzheefFg=;
 b=idLfv1ilDizLmqIzN61Jg0hGt0PH90u8gTat3Tz816EZ1fpB7SwujvNV+f/SdYwJdD
 SE0zDt28mqiF/ZTr5LNv8XWtCZZOQ6o1m8ug1MCsQisTcy3sOY6lRLZ9YOKe/ot+Bver
 9hnZD4hZhJ2aBcBudLe4eUBzeYT6kd3eECZSoGQ+mpUhxOVRwrpY9U8Mm7XKMd4coD8l
 IlRcTsbIaH4YX4m+W/B0o5Ww8kKxzHHBuKR0d4EPpPSDY8kvIXy7LeaaaU9uFv8JOLql
 0mWdHWznsrb7NdYNrYOfBY0bzvOAYHXy4O07H55qY7KlbHfzKWB7grQxSKi6E1Oj9hvH
 TWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1E2KjRoh5QPl4QWMlc2IUWvkR+6ixdGn9JSrzheefFg=;
 b=njc1o0LAWdct7pnSqxN7QC4PdDpAdHOOuojlo1TFsRTW09be71Cv7dZ5aI/L4MyhOl
 ITiS4OaY4uSyCjMJa1EWDE3AE1stt9SHGg+DsdKUyG/xJkN/SRC/4Jk7hArUeDEekGIJ
 XuwK9nF4uIrC8/880izj0Z1befmlq5mgLqwQntq1XyIAsRn7Pn4BmpFFL2bo9ljW6CbO
 HnH6mpC4XPk7PjhjuWRXoGigVnr5ehBdSOlbaaHBjSMTQxFP4wQo8r+W07F/3QtHj7PK
 FSzT4Q7qGHCpBkuj32dnxEHa2OyAOFr4sOr0BrpB71cELlHS8ie68H154Xm95Ccyo3CQ
 LP/g==
X-Gm-Message-State: AOAM533/iJruXuuxiEPZE0NxMdLAulmq2PVHM9valLjQLEbWJ7cd3TB3
 +D1bpngnXViDE9h9dJQQFCYHlw==
X-Google-Smtp-Source: ABdhPJwO5grJqRAgA1XNoFKUoNoU+h2BcmLSXzb5kwD5rMkFiB4D067C/be3+G1ireruH4pCRhKW7Q==
X-Received: by 2002:a1c:f310:: with SMTP id q16mr2295490wmq.148.1641976584294; 
 Wed, 12 Jan 2022 00:36:24 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:381b:6e50:a892:5269?
 ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id o10sm4351118wmq.31.2022.01.12.00.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:36:23 -0800 (PST)
Subject: Re: [PATCH V2 2/2] soc: s4: Add support for power domains controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "Shunzhou.Jiang" <shunzhou.jiang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com
References: <20211230094434.3053195-1-shunzhou.jiang@amlogic.com>
 <20211230094434.3053195-3-shunzhou.jiang@amlogic.com>
 <CAFBinCALAOJz16=u7r8tLM6ditriq=-NOACS2HRLrWs5B_FkVA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b2a9b8f0-2b12-c49f-9609-21999b1fffc8@baylibre.com>
Date: Wed, 12 Jan 2022 09:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCALAOJz16=u7r8tLM6ditriq=-NOACS2HRLrWs5B_FkVA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_003625_866884_D513E49F 
X-CRM114-Status: GOOD (  19.82  )
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

Hi Shunzhou,

On 30/12/2021 23:15, Martin Blumenstingl wrote:
> On Thu, Dec 30, 2021 at 10:44 AM Shunzhou.Jiang
> <shunzhou.jiang@amlogic.com> wrote:
>>
>> From: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
>>
>> Add support s4 Power controller. In s4, power control
>> registers are in secure domain, and should be accessed by smc.
>>
>> Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
> Also here I don't have any datasheet to compare this with, so this gets my:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]
>> +       SEC_PD(S4_VPU_HDMI,     GENPD_FLAG_ALWAYS_ON),
>> +       SEC_PD(S4_USB_COMB,     GENPD_FLAG_ALWAYS_ON),
>> +       SEC_PD(S4_GE2D,         0),
>> +       SEC_PD(S4_ETH,          GENPD_FLAG_ALWAYS_ON),
> For the A1 SoC's UART entry we have the following comment which
> explains why we want to to be "always on":
>   UART should keep working in ATF after suspend and before resume
> 
> If for some reason you need to re-send this series then it would be
> great if you could add a comment above each entry with
> GENPD_FLAG_ALWAYS_ON.
> It will help others (like me) understand these SoCs better.

Can you resend with those comments added so I can apply the patches ?

Thanks,
Neil

> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
