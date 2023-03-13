Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D768C7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCUV8jYJHXva5c1mQp4jfoJNSE3o6XS2n8Il6AH6Uzo=; b=tXKfzjqzzSFFFM
	DSloxR8Wtt5VlJTu04xOx7AvIAtjbIpqkFLH/Kwfzt/4tr8jh+ouwivG6+ajvNZOmvmwI12zVILtu
	Wp1oUmbcWXMsuIscEUWZvIk5S7HPCDp01ZzptKiR6NLgkpxPvinlLO0Sg95yMdg/vuU1AxBqdNwyG
	oNmuCRiGcRkdCrpJOcjGGi3mjhSEpHabO0AdspdCZ/GshEEd1ZPB/uYh/F5Mvt8eOzByqsYW1UQTV
	p0S6ln3reZgbrj8K4AMq2WDtZe2MpYwMTNS3ejj73Oks4aX/XB8A5+m5HWt3KCsfPGT8uOsgzMcJ+
	Hhcaxa7hG2Mbvz1c0Hdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbeMl-004y56-AR; Mon, 13 Mar 2023 09:21:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbeMg-004y2j-1C
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 09:21:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so7335867wmq.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Mar 2023 02:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678699268;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=NyKmnb2IGGlRYKdA8v+Oi9cQGOt819vf2di9Hwq+CB0=;
        b=mSVsf+a/ifTL56wAV9Qw2FDlsV5LEVpddsOHAnmgmNWX8ZYxk80hyF4aQqagAEUpRc
         jDtW5tGU1a1sIXrahUuJD2t838vwVvvnj4Ixlt8aS35T1up5M9BaMB/TiJMSOI2IGuV9
         4DpczCsw5ChdGLdIiV66BOPSrFanB1m6q32U2VqzOEmNpUIv9k55vB8EjTbMZCdowJuu
         /SVQvLaRF7kjaEKEuU54weShdspUHgoj7wr916M1wsEnxth4j2CBMJB6SrbWvLaot6br
         AjjW9ZVSxTuneR96w0vxXlzXrgJAt5qX1svj0H5QfW8P15XTzrOhQpO06GBAV80jJ6Q2
         9YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678699268;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyKmnb2IGGlRYKdA8v+Oi9cQGOt819vf2di9Hwq+CB0=;
        b=6mtu6xzCI8SxY47zs5LywDKUNtw2xfYWmdJqDEqdtdT+A1gOGxIfLC4JqsoNmXaKGz
         ZsLUZw6strif3ZFVmwceFIyKbOPbW0QBmXa13T7ScL8SMhpuaP+RHmyHBzRW/elLWhfo
         UniFNHQ4BA6vGHUTbpIGa3Z/OdQNB86UfplfSZa315SYShg6J20QGQsGYdr4g8P04qiZ
         myUvctmAH7aZsj4flgGcfBlajOd6fHPwI15J0D4XogUcUNCnPBB26hnrCXI1M7v8vzAk
         Tfg6TGVASc6115k70/IONUC5h/NoSDGjBeSm8woXWUoiiMLz5nqcWDAG69SuzFIYwXCa
         OrVA==
X-Gm-Message-State: AO0yUKUzLOOwx8XFnKRzLyk9wk5kSB6vh6hgq8rqtZYi9uJwfHR5+Vs6
	Ojqbv4RJ7xUTp4n4klh4OIlrWg==
X-Google-Smtp-Source: AK7set+ffANocDz449+nx/CU8mE/uaLR+A5C2On6Z7RmrE6Px8IYI5sqoAqzr08nkoqwgeu6K+3K2w==
X-Received: by 2002:a05:600c:1c9a:b0:3ed:2418:6cbe with SMTP id k26-20020a05600c1c9a00b003ed24186cbemr2701778wms.39.1678699267735;
        Mon, 13 Mar 2023 02:21:07 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c378400b003e215a796fasm8292361wmr.34.2023.03.13.02.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 02:21:07 -0700 (PDT)
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-3-ddrokosov@sberdevices.ru>
 <1jr0u2azfi.fsf@starbuckisacylon.baylibre.com>
 <20230306200549.7iuedbl27ejfhf6b@CAB-WSD-L081021>
 <1jlek60zun.fsf@starbuckisacylon.baylibre.com>
 <20230309182857.a2fzotcejueio23w@CAB-WSD-L081021>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 2/5] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
Date: Mon, 13 Mar 2023 10:18:02 +0100
In-reply-to: <20230309182857.a2fzotcejueio23w@CAB-WSD-L081021>
Message-ID: <1j5yb50zxz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_022110_095575_366D3731 
X-CRM114-Status: GOOD (  11.79  )
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


On Thu 09 Mar 2023 at 21:28, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

>> >> 
>> >> This last poke should not bits otherwise handled by parms.
>> >> This is a rate init in disguise.
>> >> 
>> >
>> > I believe, you are talking about hifi_pll clk_regmap conflicts with
>> > hifi_init_regs. The above init sequence shouldn't affect pll regmap setup,
>> > it doesn't touch them (we assume that default bit values are all zero):
>> >
>> >     .en = {
>> >         .reg_off = ANACTRL_HIFIPLL_CTRL0,
>> >         .shift   = 28,
>> >         .width   = 1,
>> >     },
>> >     // init_value = 0x01f18440
>> >     // en_mask    = 0x10000000
>> >
>> >     .m = {
>> >         .reg_off = ANACTRL_HIFIPLL_CTRL0,
>> >         .shift   = 0,
>> >         .width   = 8,
>> >     },
>> >     // init_value = 0x01f18440
>> >     // m_mask     = 0x0000000f
>> 
>> mask is 0xff with width 8
>> 
>
> Ah, you're right. Anyway, I think this is just init value and it's okay
> to set it during initialization and rewrite after in parameter
> propagation stage.
>

... But the magic pokes are there only to initialize the unmanaged part
of the clock regs. I'd like it to be clear and stay that way.

So please, clear the managed fields from the initial poke table.



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
