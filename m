Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D87C54FCE
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F24620788
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rhl8DPrG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ofThQBp/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F24620788
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0o64ME/L1wMZWr/oqd2yWhGCVhlRPICyE1W3d1MhW0=; b=rhl8DPrG2PECZD
	5i9f8iwooiXUFSHd3QUzcQvPfGiCDIw5HesaXPRqIHnkNM61IuIcCNx6si+bH7dwAYMrwkynaN/+I
	/C/EofNzFywLmHOiPIG/1YvSu67K64cWGU0KibBgakyKE4GLvGfSoAfrFDkG3fS07ARQ1aVeZmSw9
	vu6xByvxyZE9zTgyd1hqcAXGlDoDRsV0KZ43L4iusxzMAFEqMzG913PSobc5iZpo+nP52os7uH7tJ
	jJW0DtjD6iZpSO7ed+P8Bc2FRBHkeWl0iwqE+PafjS7zZZtE06rFT8IFcj/d2yi9QjTmEbsCEhGeR
	ciWoTnpncCoRahp48tbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGkTP-0001Em-4q; Tue, 24 Mar 2020 14:24:07 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkTM-0001DE-8i; Tue, 24 Mar 2020 14:24:05 +0000
Received: by mail-ed1-x541.google.com with SMTP id cf14so11680657edb.13;
 Tue, 24 Mar 2020 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QvAJMhrVEj0lhCeXiD2t+Sf+5S8zcMc++t+oIIyFqcc=;
 b=ofThQBp/FPnmd+jt3Us1RKqMosiZ3Ld7CXBzRMIDhVDoYmaAwBY7uU7UZ3mcqeAUgY
 rOp/qmK2OCIZ3JC4VqMneHfH983Gy421XoLJQ3vwihZRiSeHlC5zsGZshWiwBQEJkWZ3
 vJvDXa/1N/S4qiiHJuV1wyuw/LBvGPpg/zeT0km+IumovVdONxeBi34sAV0DE9r8RUCi
 BnSbWEljnUCrx48XJBdTMfPDedTQ7Q26FY+sy3jqj3mZK6IqhcTkUiEws7qZDFzwCGF9
 8qhYqIeqDEMJuXGAZ9boHindf0mteZyl3iCHYSf3f16vhvRUJmO4RehoU6COPpxa/pOG
 SSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvAJMhrVEj0lhCeXiD2t+Sf+5S8zcMc++t+oIIyFqcc=;
 b=nmRS6K9JFL/SzknZv3v/xHUEJvtV8K1RVhpnButLkunztcsOFM+VFvNpHHnBQDWqvK
 pYEKmDwNUV/SdqpQYJtzT4Qc3cePoUpyvP/JcDrYCkmScXRClMa79FO+NUHNHl7Y1Q3T
 WjXh7wo75nPYxAOp7TocNHGejxKQpqHUhRHeoeITC2PsOk6zghJgx6vXUX9HYor9VSN1
 tfjIYSPFuR60fXwHxgQityV3d8bfYcdnDRKBtOsHow5myxl2D7f/AWuDJ3/DSqFpq/kM
 9b3XRH7+pxw378OSHOC5FNGzugar7HQKuoPvrJnMaKVQ8TBgQk4H82BWUdz9RNis1dUZ
 HMzQ==
X-Gm-Message-State: ANhLgQ3lsKvCvnKX4/maCc7WyXg6bk5TzzFYOvY3XXMYR8WRHdWcpT9p
 HSM8K0B6pVQft3cL+Oy95zHaL96ghBDmmYTXxCQ=
X-Google-Smtp-Source: ADFU+vv3y/Han0bqNS7oHPaFZG+M0NVgMJpj16d4Bgc4iE3n14CjrUhR6lEygqPtDHjI6W5B/3MdAYQNafV5Vu0eBek=
X-Received: by 2002:aa7:de13:: with SMTP id h19mr27875188edv.52.1585059842383; 
 Tue, 24 Mar 2020 07:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200324102030.31000-1-narmstrong@baylibre.com>
 <20200324102030.31000-5-narmstrong@baylibre.com>
In-Reply-To: <20200324102030.31000-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Mar 2020 15:23:51 +0100
Message-ID: <CAFBinCA4VwQmd5msALXUrPxJy9gmeRQ5-5=UdNvx2aCGkPq_sw@mail.gmail.com>
Subject: Re: [PATCH 04/13] usb: dwc3: meson-g12a: get the reset as shared
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_072404_327691_A6D239B4 
X-CRM114-Status: UNSURE (   7.87  )
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
Cc: balbi@kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Mar 24, 2020 at 11:20 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> In order to support the Amlogic GXL/GXM SoCs, the reset line must
> be handled as shared since also used by the PHYs.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
