Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E84C10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 11:41:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F26E20869
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 11:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GX5lqcG4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="V1ZWuQQk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F26E20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rEPk/GZcYC3WYmki6x6MBC96u4nBKaGZn+5ybcNhYo=; b=GX5lqcG4X8ltex
	ae7genPyU05GsjJZqD+C4tvbB+LOgJy2eT4yjc1A5c86O+J5orHKx/EjTNXCfzRqT3os+UYBB54yQ
	Sp+naDwh9tplJEOV2TF3A9eyDUND/JyMXQeaseY374nG76WIrwfNID0tsTJTgQDL05ecYH4F7W9Hq
	H2nBBEFaR8AYOScZ91HXwGQGx50JLzYV5uPwAPaxJtZJsZcJNGXKGa8XkrMAmPbXYgY0PoeRzD7WI
	mggWdk8vrnr0BhY1GNX9/FIZvwtQDRi23mpyVSSWXpGyv9BL2zlvZUdlPpdXVEesmW8PR71ZlW9vP
	Gvm9Dl5jAuobL2QWVGKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFH2M-0002Xr-L1; Sat, 13 Apr 2019 11:41:34 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFH2J-0002We-Db; Sat, 13 Apr 2019 11:41:32 +0000
Received: by mail-oi1-x229.google.com with SMTP id i21so10110044oib.11;
 Sat, 13 Apr 2019 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q13kuNkTBHkcWihycz+KK0I6eBNtjvR1vvA6Tk/zFZ4=;
 b=V1ZWuQQkDMT1//qpcFkGoC2aB0YLJrrRq+qF3dz7XUtNX1GQgFS56T7GJbuam2wqOK
 eMKjlsuRgTm3SXA195kuV9wJ7C7/a2V6FwFmcZtGPb48oCZcKXJfKZw7jjAA/VIsXW09
 50Df+q0L2AL/7CPOsl5nQofExF4JQAuB2nG/Wwss6yPO56a7yfdJVIznl0MR3EylBBIA
 Oi5GkzCUlvbxbMwBzkzXgSNaD/0HwhUupQ2E2xmixYvkYmfaJ+jEiMWZGTP/iD5jWml7
 l3FM4bxOYinnDfARhGRhHYP3OvHrMbv6yezxoNCWpQGF8g3/aa3/DsSF+xWpSXBrpwHa
 06HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q13kuNkTBHkcWihycz+KK0I6eBNtjvR1vvA6Tk/zFZ4=;
 b=gn9Z78oKTpvdw5xsuCyVxL586PulTbUWvlQCCoi2y6iIyShe+hhlNBkwxWjexPrJp2
 2lopGAmhZRjimJDndidgI4/z8fX7kjRWWDsOxFuDtaK73jwBgAJT3csLqZD1FKjOSwVw
 VRyVFMjWud81CKFTdbvXz0N8scQbt2K8Hdjmv6Yq2l3qJF3V/y6UbBibnBfQKK+TtM1G
 I8kNxQ33WFxAlYfjuTdiEUQP8Ff8ZtlrzUModLCO/h/bNwcy4ZUAafXFnLlNBuHH1pVK
 5+nDkNlQK2O9UKotfivQk1RtPzI4AEFEjj8iOafhHzMxjjZJWC9lZEYHAVvhuA66bW0y
 PB6g==
X-Gm-Message-State: APjAAAUWfL28tHSrfDrXdqyPaiotd4EVI9axO13hJoPxLr/szknm7OhU
 Lyp3eGBBiLZqPbhcOHKtBt3PpYfjm0/alQ8zGHI=
X-Google-Smtp-Source: APXvYqyvBEoNM+100tF5Ew7Nv2paa0mwftXH+HmOHRp7JUWfyGWsV/q0zfmDL3q7w43lw52wTnk4ivATNrJaLoyjewc=
X-Received: by 2002:aca:b68a:: with SMTP id g132mr13298471oif.47.1555155690122; 
 Sat, 13 Apr 2019 04:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190412100221.26740-1-glaroque@baylibre.com>
 <20190412100221.26740-2-glaroque@baylibre.com>
In-Reply-To: <20190412100221.26740-2-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 13 Apr 2019 13:41:19 +0200
Message-ID: <CAFBinCCd1EkvcwX0aiKxPXepyndu8_VhKq+RFVU7KxzYNftUJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: g12a-clkc: add Temperature
 Sensor clock ID
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_044131_485411_D863DBB2 
X-CRM114-Status: UNSURE (   5.98  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2019 at 12:02 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Add clock id used by temperature sensor for G12A Socs
nit-pick if you have to re-send if for some reason: "used by the
temperature sensors for G12A SoCs" (because as far as I know the two
temperature sensors share this clock)

> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
