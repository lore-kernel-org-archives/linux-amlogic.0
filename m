Return-Path: <SRS0=HPE/=V3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9FCC0650F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 07:16:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D14220882
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 07:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gm55bdLE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CMclCEjk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D14220882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSdO796dC1j6sMYa68Ahb8ojSyETnfPRC+CHEHXOM7Q=; b=Gm55bdLEIDfJfA
	oxcPoAdMtu3d5ToUR+Ga7PC9BIdG9ZUbW0s7mCm0sZ1xsTVianT5iKMbETPSzEqq84qiEfRWjO1c+
	yV3qB50LriP4B0/waCwemeD/dc6+nWrBRp5HzhHQmxdjhWMPoqbLELEQ6eBEceGQFV9s0S4hUFHxp
	X8z6rPWFAx5/W4K/WkJlNwq+i2NHF5Rrn7SRlyP8EcoW2ddlBtNpm50Re0dv+c5z867qwypo+htd4
	55En7YVfibgjEYeL45jiIUUE5UIDEVdGIhBxepmD6q4U/B1ITuSF5SMCt6rEVKxDa+xib8BvbtN89
	qK9hLpen74nprtMB6oRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsMNJ-0001no-7g; Tue, 30 Jul 2019 07:16:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsMNF-0001my-M8
 for linux-amlogic@lists.infradead.org; Tue, 30 Jul 2019 07:16:43 +0000
Received: by mail-wm1-x341.google.com with SMTP id v19so55636298wmj.5
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2019 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CJsSNfY0mqrUC/YwU9xthUF4qULj3egsKAW0izWqbew=;
 b=CMclCEjk0ZwGT0UKhUhteWTHe+Ssve3/diYK0hb0jopkULcSn6hYPcrFB3JAA1RGFu
 759vTHQhFDBVGXHh7bSEoU1TxNSzrKuYqY6SZRN65IlQ5SHj9DWv1cvcTZL/ksKksoSr
 WhRZpBkGY1m7Of8SsJeLq4YNzrTpSSnLvY9QOwWGoSXwwg0ZL0k5ghdCWTnJZaz1BsFC
 2+AYQHH61QBZwT72zlCMlC54F5asO1+hBFVNw9M3m0JpXL4Wj5mfJiHmcL6zEntvu+hM
 dQ/Rvd13FdzX1IXFVu/IPHC6hyyIMOMUZDzzCCmVVTZUZngoznNsOXSVbAbnSmucvs/T
 4WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CJsSNfY0mqrUC/YwU9xthUF4qULj3egsKAW0izWqbew=;
 b=R5NF2GrKeouIPhg6q9ZPrKok1v70iG6y80sAEibVxYd5d4NKblx3dVBnSOgoPXqn2m
 bOlfq2rotxtklJUwMeuiZekZwUCDMKDazWmaio5GlTrX98uThe5o5nVqVKNmGDEOUKKf
 KRcoNde6gPqgAB3HVzV1Xw0XYixTRSFjot0hwtRzC31Ez42lDGygDhTEZWJ3wuaSQkZ1
 2FrAl4qUrxN8ye/bVzFUBDJCGZIVKC69qzcyKTgHTmnbJ3cLh7l+84TWIHoxTtLCUWs9
 xPRXLmKoF6z6gqjIUtY66R+zRVESxSozezzwgSCWx+fdE1WYxGWDXCYDfn27hIl2Ywxq
 zPyw==
X-Gm-Message-State: APjAAAVayOmEhbOgnfAH9BHQcBygeU+0D2HaE6OdmtR64dCGlj4FmeQ0
 8gsjP4oi9wiP6/VzNK8gt8+jRQ==
X-Google-Smtp-Source: APXvYqzNdHpUKuNShIQ7fuZIz7FKvr2+m6gWQ/l+o20rxgU0SEoN5hvd9TKY8jVLr6hYGYOcQotSgA==
X-Received: by 2002:a1c:f914:: with SMTP id x20mr25700078wmh.142.1564470999447; 
 Tue, 30 Jul 2019 00:16:39 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id w7sm73283967wrn.11.2019.07.30.00.16.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 00:16:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] clk: meson: axg-audio: add g12a reset support
In-Reply-To: <20190729222944.116DF2070D@mail.kernel.org>
References: <20190703122614.3579-1-jbrunet@baylibre.com>
 <20190703122614.3579-3-jbrunet@baylibre.com>
 <20190729222944.116DF2070D@mail.kernel.org>
Date: Tue, 30 Jul 2019 09:16:37 +0200
Message-ID: <1jk1c0uh4a.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_001641_798363_7FFDC17A 
X-CRM114-Status: UNSURE (   6.54  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 29 Jul 2019 at 15:29, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2019-07-03 05:26:14)
>> @@ -1005,8 +1087,27 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>>                 }
>>         }
>>  
>> -       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>> -                                          data->hw_onecell_data);
>> +       ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>> +                                       data->hw_onecell_data);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Stop here if there is no reset */
>> +       if (!data->reset_num)
>> +               return 0;
>> +
>> +       rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
>> +       if (!rst)
>> +               return -ENOMEM;
>> +
>> +       rst->map = map;
>> +       rst->offset = data->reset_offset;
>> +       rst->rstc.nr_resets = data->reset_num;
>> +       rst->rstc.ops = &axg_audio_rstc_ops;
>> +       rst->rstc.of_node = dev->of_node;
>> +       rst->rstc.owner = THIS_MODULE;
>> +
>> +       return ret = devm_reset_controller_register(dev, &rst->rstc);
>
> IS this a typo? Just return devm instead?

Typo it is. Thanks for pointing it out.

>
>>  }
>>  
>>  static const struct audioclk_data axg_audioclk_data = {

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
