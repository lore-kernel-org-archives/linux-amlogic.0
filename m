Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C426C31E40
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:19:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A04B205C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:19:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVYvxJcR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="oaIkeSJH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A04B205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihuOW4+qD8PFMYWPhIGvLyFAmhpzb779viALrYOypuQ=; b=WVYvxJcRcvm7G1
	Gw/dZIaQ34HxmIYD1ui3wl5pGrVtnzBMAeJr8hgTO1TYpRZsqBBGzPvrIjpXqbxM1k6j+GSVaS5vP
	UCXJOYuz/LUlsEm7DHAOZL8tbTXZpjid4KLofraETxNAwfgHntvFjzlYzbc67r26sogVzlsBbxikm
	6q+JtC8/G02Ba/pG6y2hnGjtx6bpH8YOd9h7THox1nNHn1qVAV6cXkLI7QJ7NlQZBFjbm6RKpgh6Y
	/VN9QAd9kfldV925lQMP4LDofS/MWhXQRx5G7p/1k9ExrfssubN6GpFTZe+JfTdPNd19AEfNF9aL1
	NrRpJVIOQe2koq0eJR4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv4zb-0005lt-K7; Tue, 06 Aug 2019 19:19:31 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv4zZ-0005lU-Bu; Tue, 06 Aug 2019 19:19:30 +0000
Received: by mail-ot1-x341.google.com with SMTP id r21so89316910otq.6;
 Tue, 06 Aug 2019 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c/Q5ObqyzJaSPg2Xe3lSXX0q6SY0vIcGMlw0bit7lHA=;
 b=oaIkeSJHjTBqWkr+GCgY1KG10x+DGg+H2XpFd2QJ4nAZ0E0F2SiFIB5eLkQ77d8CNf
 WL4q0YcZ8zxKHaFgP7A5UI59RWzRsm2/L4yO3QbHhXky0LdB3a/iPGZXbpT9/bmFb3+M
 WLKF1sKhn4gXF9VWNsgwRaiTTsPP84DJWFo3Ze0+hIOjaFpRYh8Vx2rWuXKwzS9bSQX6
 spSLLGjC0YzOHRRoPFEPd4wE+/fBbmbKmdrRSkiFpuRr2EZPYBI1+lnQ3pLuMAbaCZ92
 F24vdzrYjU57MqXWxtJwRMcAO2ZXMJsuKDQAAASWfsT0PA1f946skCN1bba19YxIV0m3
 ZjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c/Q5ObqyzJaSPg2Xe3lSXX0q6SY0vIcGMlw0bit7lHA=;
 b=SG5cs+zRBLonKOTKVbPs61pYJMX7oCXcoljQ1b3iGAJCUmRoS8I3gYxzoLjeEE4bKK
 DQpaejkQ+EnKUZO3z90LA4HaOHvlakdhcudAPWzd7TIQH6+nLtA7ifg0pKlMi/j+V3vn
 pFKHYzN3V3sgnarNaHfHK9/3k+CnRD/FvuIumMK6U6GlMqVNYiyrR8lAwHp2wK7zL+d+
 IpGAXkTl6osObEk6fmHt47o4gCu3G099S6o14JM8eWbSU42cr5LW2pnT/DmYqNt0Mxpy
 xVdXpV3cNONb9SvS/7EOO2AgvaXE3PxBqDS02jgDnFWqN92Lz/K+PtJAYKzpZrxW6eKu
 HxEg==
X-Gm-Message-State: APjAAAWVDI5k8xUtEkxm1EIXNkc//22Y10HkzPTsp5TQGZMQzjB4VlbP
 J2hlwNKBEeMGH2yBKyO45IAOlNTL71bgFq+nRVM=
X-Google-Smtp-Source: APXvYqx8+wGIEHcLqq6rnmYE4bdlJ/kknBnIKvT6BBs5vbtN1414sxoJkLwKA2XxJextp82XgKVOdTl4dqrfmxJ2Szs=
X-Received: by 2002:a05:6830:1e5a:: with SMTP id
 e26mr4111309otj.96.1565119168049; 
 Tue, 06 Aug 2019 12:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-3-narmstrong@baylibre.com>
In-Reply-To: <20190805120320.32282-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2019 21:19:17 +0200
Message-ID: <CAFBinCBQLH6-f2s-0GJccJ=7G2iVjnHfvZy=d63TdBjra6wqPw@mail.gmail.com>
Subject: Re: [RFCv2 2/9] dt-bindings: rng: amlogic,meson-rng: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_121929_413227_CD8197F8 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 5, 2019 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Random Number generator over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
