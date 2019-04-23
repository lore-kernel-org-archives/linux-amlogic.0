Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB0CC10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3875020811
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:36:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n1Je5ggE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="P7Z8rw49"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3875020811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fldcXZd71+B6DkcrLBuw+vpfZJw7Venz5/2uXOnX0jA=; b=n1Je5ggEipl2fG
	XVfIu7DZi8HnJY8AWlgNhgTGyuI3mc5kz3ulj2+aGVJLtcBVat3vMv8negm9XzhHGCeMBJQAG/456
	s0TRkfpcQokWGTZ1aHFZnz4ir0jHXmcG+XIJDSEtqVMh0WJWz9ZYGKDSDdGaKzBra+s0c6K8o0QzR
	EPrd8uV05Vm/8pPanOpUfY/yA0PWGlqBh4/xvhaXJHtbHcuRb/nUrHnQipOdCh6LC7pDYdsTDzZ2C
	K0zkS/oQ2eINvmJ4aRFhjruGnvy+daG1XOnSUouWAiKmm3Wcs5PwYkdx/6P4sigGlwtnrrgGTm99i
	IkY9akLpHf5ZhFZRn+iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrqK-00036p-Fp; Tue, 23 Apr 2019 09:36:00 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrqB-00030P-P1
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:35:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id a9so1717693wrp.6
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pWKVWNtyyZ2MoEwkhSsdKvjBahT4qx/ajE/sXTxPDfg=;
 b=P7Z8rw49yNckGtPY7UEIKDtQhB0EWi7uZz8my1gkIc3B/naDShRkw6Knd16Hk66Qjc
 V6XuThamSTC7wHsz2Qtvep90H1ZuzU9p+U8cJfPhteZJegFFtb/dg7SwIme2QMJ8iAa9
 PK7+cNQLt7cQeWZoJ6lvHR7KgcDzPfDI7PEFe3NWm/V/dr7WTCh6ZJYmwG+LkQeJp/n2
 wLKp6+8fwMA28pL0p2uoiDPKMvheQ+PE1dbog8s9HZArxLa8IYz6Qy/xV4HV63LiGAhT
 9WQ0vYq918w7YcWLZK7YnDpTHB4OlHJcuqMhAPcYfYQcELv/peF4R1keUSkDuaGIVNAI
 Xzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pWKVWNtyyZ2MoEwkhSsdKvjBahT4qx/ajE/sXTxPDfg=;
 b=SE1+hqCy5WqZTXy9+qL+lP6KeyCUm4e0BIt1wmn+OPb0PO9O35vZkvvy0K+dagLksI
 kSpTNgsaoHaxhnrmXi/a21XwYsPzWMDUe0i1UqNNkO0IveNP62DGQYcQV9Hu/SHCW+/T
 xjBAYH/luTrQkYochyn1Xps/Wap/dm9qEBPjhGh40rNIRbJS9zOy6utztLdThdjFTFEy
 8wf5kUdAR8fgT5MzPqDGaxKyXVzDvLH3qoXHmWW4NDg335k+r1/dkIHBXJwGokuAY9a8
 Tfnq4K7cjKbL8JyRuBNK653YimCJuO0poEVBIz4WsX4nq0wSf0EmxqNb+6KR8bqJgxAy
 pL7Q==
X-Gm-Message-State: APjAAAVND677v3HC5tY0O1RNWtDN1M/Aypp8LwKkKeuV2/uwHfLLsH1e
 386+yRVJbed7fjv1W1xlOj1Cvw==
X-Google-Smtp-Source: APXvYqy3vUSnBzOLfvlV9pAsRcmNp/mQSfvb5m6wkiduLaPoJQarvlLDvbAHFUroqV9jqv/aqw2bBQ==
X-Received: by 2002:adf:e74f:: with SMTP id c15mr15689274wrn.23.1556012150207; 
 Tue, 23 Apr 2019 02:35:50 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d7sm13773075wmf.31.2019.04.23.02.35.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Apr 2019 02:35:49 -0700 (PDT)
Subject: Re: [PATCH 2/3] pwm: meson: Add clock source configuration for Meson
 G12A
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190412092337.6941-1-narmstrong@baylibre.com>
 <20190412092337.6941-3-narmstrong@baylibre.com>
 <CAFBinCA3iFSW4K8FJN913CcsxM4YFc2Of9Ldpn7230Ss427mMA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <dafeb987-b4e2-3830-7efe-dfe7eb1ce309@baylibre.com>
Date: Tue, 23 Apr 2019 11:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCA3iFSW4K8FJN913CcsxM4YFc2Of9Ldpn7230Ss427mMA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_023551_978210_14F35ECA 
X-CRM114-Status: GOOD (  20.76  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/04/2019 13:33, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Apr 12, 2019 at 11:24 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> For PWM controller in the Meson G12A SoC, the EE domain and AO domain
>> have different clock sources. This patch tries to describe them in the
>> DT compatible data.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/pwm/pwm-meson.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>> index 2b03938039b6..46287cc8a0eb 100644
>> --- a/drivers/pwm/pwm-meson.c
>> +++ b/drivers/pwm/pwm-meson.c
>> @@ -434,6 +434,15 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
>>         .num_parents = ARRAY_SIZE(pwm_axg_ao_parent_names),
>>  };
>>
>> +static const char * const pwm_g12a_ee_parent_names[] = {
>> +       "xtal", "hdmi_pll", "fclk_div4", "fclk_div3"
>> +};
>> +
>> +static const struct meson_pwm_data pwm_g12a_ee_data = {
>> +       .parent_names = pwm_g12a_ee_parent_names,
>> +       .num_parents = ARRAY_SIZE(pwm_g12a_ee_parent_names),
>> +};
>> +
>>  static const struct of_device_id meson_pwm_matches[] = {
>>         {
>>                 .compatible = "amlogic,meson8b-pwm",
>> @@ -455,6 +464,14 @@ static const struct of_device_id meson_pwm_matches[] = {
>>                 .compatible = "amlogic,meson-axg-ao-pwm",
>>                 .data = &pwm_axg_ao_data
>>         },
>> +       {
>> +               .compatible = "amlogic,meson-g12a-ee-pwm",
>> +               .data = &pwm_g12a_ee_data
>> +       },
> the PWM part is fine for me
> 
>> +       {
>> +               .compatible = "amlogic,meson-g12a-ao-pwm",
>> +               .data = &pwm_axg_ao_data
>> +       },
>>         {},
> but I'm not sure about "amlogic,meson-g12a-ao-pwm":
> the public S922X datasheet from Hardkernel [0] section 6.6.1.2 "AO
> Clock Tree" (page 107) mentions two different clock sources for the AO
> PWMs:
> - AO PWM A and B has parents xtal, aoclk81, fclk_div4 and fclk_div5
> (pwm_axg_ao_data has the first two parents swapped)
> - AO PWM C and D only have xtal and aoclk81 as parents

You are right, and it's the same on G12A.

> 
> regarding the clock parents:
> I'm not sure whether pwm_axg_ao_data is wrong, G12A is different from
> G12B or the G12B datasheet is "correct". can you please list what you
> have tested so far and confirm that the parents you are using are
> "correct"

You were right, we need 2 different compatibles here...

> 
> regarding the compatible string "amlogic,meson-g12a-ao-pwm":
> if there are two different AO PWM modules, should we name it
> differently, for example by splitting this compatible string into:
> - "amlogic,meson-g12a-ao-pwm-ab" (with parents: xtal, aoclk81,
> fclk_div4 and fclk_div5)
> - "amlogic,meson-g12a-ao-pwm-cd" (with parents: xtal and aoclk81)
> 

Exact

> 
> Regards
> Martin
> 
> 
> [0] https://dn.odroid.com/S922X/ODROID-N2/Datasheet/S922X_Public_Datasheet_V0.2.pdf
> 


Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
