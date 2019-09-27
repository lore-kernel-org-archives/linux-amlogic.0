Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876B5C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 14:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FD820872
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 14:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TdLzvqSD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QwhnczTv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FD820872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Kr7EH5lANOzEt4XNPKsnJ5JvsOHtM5sDFv0JM93F5jE=; b=TdLzvqSDdHmnc5D5SHWnHRpTG5
	Qy7D5K3YvTPSkG8FM9RQnYrR4Lv2g610e6lsicPzneF09iMeL9eJ23ycHUqb3feHpI6q6S5ExIwxi
	TdXa7d04LjI2hfJk1oJU4ZgzvzekfpIo+xA6XGBvGmIOxSl4jXWSlmygInV2REhbWtz4isNfVPO/c
	cotLLb0KX9kHJP174pRESJl74NYfKgF93hIc73jeJANAg3AupBsYsGBdnGlLofvthmrNBcu0CLFO/
	minP2z2fCmsp+JSHTCn9MPksNPNci5GL3oiI/JKUN9bkai4T2mtPTfLfM4HAqgzAm/2UyHuZJevsU
	8NFVtg9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDqod-0005p8-Sc; Fri, 27 Sep 2019 14:01:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDqoc-0005oh-0y
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 14:01:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id l3so2868858wru.7
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=RKXGJO67bSVwcMxapZtp3HQ/bxJlidvJPusHAL8DCEE=;
 b=QwhnczTvZSqyKTVGhoX1/k1O5JUcXrinwvEVzw/2GMgtscxYn2JQt+cGP8Y/nPnben
 Kx2+3Klv2P28K2aOxrY/0eRB2f5cU9PyoIlwiyjwYE6C1xryj4SNW5marQTWm6VzUGhh
 w0innW9sm1+Zk4kJlhf+Emm/+95/3hyFVnnxvzewx+UvSwA35qpjwyxBU32dYs6dZ/jQ
 eGEwyNz++7qiZYmA+uYRyv4jnrPCgSZ8F5yZr0FcnUJr4bjo4uAREFH3G4cdK+frUjnG
 48EV8cVtDuYd09+Qk/tnwG3BrPSv+wlJbNh/BWXPqcoSUEwndWxTf69UZjKcWpsK5NTa
 q8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=RKXGJO67bSVwcMxapZtp3HQ/bxJlidvJPusHAL8DCEE=;
 b=hDdLmoTYoBLbh4OLT3qTn7NCqt3pRLDKsujPA196eU0oz32P+CSg1BRoK5j26QD75X
 wBqj04kFDmx9o/zv3Fcoi5wZuNVLbO134Xuckk5c2ePcvgyzomQBwQ52tMePKSzlQPDs
 bT2HvdUmQkkfOqG4AXE2gbcOLHa9zX0q3SvupP1oArfyyNbaToFXF7z9F5GG4s9rAZ8v
 ef9DU2yw6QYjd5ntyEVTbyS24XA9aWc3BGLo5kShxnHOnBNU8WqDOOtDO33DMNsvV+2p
 4hn/ppA2q6YixOMaPSDK9BnEFz/3nhvyHflmC2w9y/1Lw1W/2AvamWCEY/RvXu53D9i6
 KCEQ==
X-Gm-Message-State: APjAAAUyq4TnvXJm4es/BBXec5eHOgSlGAFzHBMLw6XvLo3FMMPsKpJu
 P9bEelpEesRQnZQeZgGEK+k+zE0oTlk=
X-Google-Smtp-Source: APXvYqzOuKYxBRVn2GcuMubPwocxzt5Z1JaAXuyzDNij4c6n2cyhfFh4z6NQyBhBElqMeCRehy8T6A==
X-Received: by 2002:a5d:4f04:: with SMTP id c4mr2443279wru.98.1569592904391;
 Fri, 27 Sep 2019 07:01:44 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f10sm4276096wml.4.2019.09.27.07.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 07:01:43 -0700 (PDT)
References: <20190924153356.24103-1-jbrunet@baylibre.com>
 <20190924153356.24103-8-jbrunet@baylibre.com>
 <22415bc6-2550-d927-93e0-88f6aa2bee9d@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 7/7] clk: meson: axg_audio: add sm1 support
In-reply-to: <22415bc6-2550-d927-93e0-88f6aa2bee9d@baylibre.com>
Date: Fri, 27 Sep 2019 16:01:42 +0200
Message-ID: <1jftkh25yx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_070146_067486_70452235 
X-CRM114-Status: UNSURE (   4.74  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 27 Sep 2019 at 11:36, Neil Armstrong <narmstrong@baylibre.com> wrote:

>>  
>>  static struct clk_regmap spdifout_clk_sel =
>>  	AUD_MST_MCLK_MUX(spdifout_clk, AUDIO_CLK_SPDIFOUT_CTRL);
>> @@ -502,7 +522,6 @@ static struct clk_regmap tdmout_c_lrclk =
>>  	AUD_TDM_LRLCK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
>>  
>>  /* AXG/G12A Clocks */
>> -
>
> Spurious line remove

Oops, I'll migrate that to the appropriate change, Thx

>
>>  static struct clk_hw axg_aud_top = {
>>  	.init = &(struct clk_init_data) {
>>  		/* Provide aud_top signal name on axg and g12a */
>> @@ -573,7 +592,185 @@ static struct clk_regmap g12a_tdm_sclk_pad_2 = AUD_TDM_PAD_CTRL(
>
> Small nit, but:
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
