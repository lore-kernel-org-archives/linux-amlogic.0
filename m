Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D755EC41621
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:13:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD42B205ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g6wSfh+B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HG4va0y9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD42B205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYKGtfwpDtJ7MN9qcX85PsCTDVQ6jyP0f1/8CjZyv7k=; b=g6wSfh+BC0Q3vh
	5o+aT3vGD+BNshsyVegjkVJR1BSdSUcLakCCdmRXAx0X8bur3jewmiJWdzmqfzS+OP5FKpTrJPl0R
	ArOrwBgtge6D9hanmeT5UU4KHZLbPvACkujY+RyRNfr0xxcz5+sWBPvg2d4Ek1+OzMlIKXAniIpiR
	Tlo12s4BXIzlraNID9OhTo6HmC7E+c9A5WkPflQd8KzbIsJMJyTS4o4WW8k0hFM0nTGtj1KChPJnQ
	EisxTJT7SWoNmJbt5F/CgyA4YlVmyCwH5BnGIODTwOeygN69jNcZacLriwBs/MIo2gbYrcybYi0wo
	ijFCbRIC3T7Z5In3s3VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGkJA-0002X2-HY; Tue, 24 Mar 2020 14:13:32 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkJ7-0002WL-2s; Tue, 24 Mar 2020 14:13:30 +0000
Received: by mail-ed1-x542.google.com with SMTP id cf14so11636587edb.13;
 Tue, 24 Mar 2020 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izwnIJDLX3PpcKebrw2ejCdxD31bp4HV/owZTH+UT9g=;
 b=HG4va0y9ptHh02lYhjFJlq3MVsocAX+qz7OV0CNLJ+lcF9w/afL82Fu1gjQM04xwhO
 CjZTMxfDlrnGjpBdVNmCPkTxrt+IkSia7ehhd4DwTeovr1wTk9Pygcm18lFH5t5h+o4b
 wRypSA2BKiZACkE8PvNp2FIWfwfSHdfsqqkT5KQODnQhwIYJbeGW4HHn0qbIQFvmp4c2
 d+EsKD2Lml8P0zyZ8y6MKBLX7vbH7nVcyKYtDQ9IkxLHDJlBrlcrw3TG2Whc6GMGwAzO
 FVcU73Sa7Ct6bV5RFKeW+A6Qk62ThRLx9N0Sd2pcVBShMno1NMHUKqRSu5oxqQEFe9Wa
 Sitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izwnIJDLX3PpcKebrw2ejCdxD31bp4HV/owZTH+UT9g=;
 b=NgxgMHsaiUezQqtDvb4ZFPGrlCywqglaTM1zyAuqN5u3gMYTKU0UYkOXhy0UXU7LLo
 wFVrX845HCkU8rKH94/o/4haZAEHpvfKf35B6ROtw9JeGMmOXksPUBqRFbWG3qbjYzuG
 UBmL3nNNl5fbVMy+dBO/ZQUt7U3LlSEv9qbGBaVS1mgY/amBw42Pve4whIYxBkuWgAqO
 m2yueoPydJXKm4gnkx/tSU9VaLgXdsjl9e89WNeBTiKyTqg09eFpZRtoDXv85tymeelz
 hTyUwrZmjTrNqPOT4jOVKEIstfY3mB2Wy9jWbq5G31q+mYdcdBMgu/CNUgvXHItvau+z
 QxnA==
X-Gm-Message-State: ANhLgQ1TaUSK+lV29tgyWKZErrIuVE7eCvTD7S3L7mWwxV77TIv1VrP+
 +WEBtR8pWtRwrzvUiAC57/NYm37hO+dzbU27zRE=
X-Google-Smtp-Source: ADFU+vt7WPNeMNKBzxAaGY+0/pg49GFYOhCk2fM4aFzPzmKpP7OAgJPKW+5rkQPYjZ8OEAPMTAU0beLSAlgB28Pi17k=
X-Received: by 2002:aa7:de13:: with SMTP id h19mr27826422edv.52.1585059207305; 
 Tue, 24 Mar 2020 07:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200324102030.31000-1-narmstrong@baylibre.com>
 <20200324102030.31000-3-narmstrong@baylibre.com>
In-Reply-To: <20200324102030.31000-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Mar 2020 15:13:16 +0100
Message-ID: <CAFBinCA9rQKWx47F2-dT4ZrCwSKW+LiwAH2VdzPKr-9ymRxkSw@mail.gmail.com>
Subject: Re: [PATCH 02/13] usb: dwc3: meson-g12a: specify phy names in soc data
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_071329_149771_1BDB797D 
X-CRM114-Status: UNSURE (   5.86  )
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
Cc: balbi@kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>, khilman@baylibre.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Mar 24, 2020 at 11:20 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +static const char *meson_a1_phy_names[] = {
> +       "usb2-phy0", "usb2-phy1"
> +};
my understanding is that the A1 SoC only has usb2-phy1.
+Cc Hanjie Lin to confirm this

apart from that:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
