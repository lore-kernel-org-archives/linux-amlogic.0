Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53FCC41621
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:07:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AF5620786
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:07:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fs83U+r5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dvJVWQ0O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AF5620786
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOZdSirPIMXP+C0HngUEyxrpXJasFQjVIuLzcPJA1lA=; b=Fs83U+r56CLM9y
	nYNkevkyJHG9YfOTmGMSCqGKpcnEXHgzuHRyRxzE6ymbHFO+kvVHnmb4uayD8JEt+5ZnDiUyQeBfv
	oP4XFUAmAxbXpdxiWPaKvE7xY8n07IU4peYK+KMcCOFEI+AzJlN6U/pRkzfxWY94KNIYGU+1JkSme
	QFaEuUmuSgll7eAkU7puglLAorLyyboep6FVwlN4cCkMZC0PqDgtuUpGkaGWVd1nW3O9p1B5+IPFT
	XgTGCRvXdmtJteKImxml1uBi/glCgT2fTMDuVF6uL8aHKg78ujfhNSjiahbSpCb5ChhDywpmf4iNq
	elvhZW4dqWQy08bECPKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGkD3-0008LN-0W; Tue, 24 Mar 2020 14:07:13 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkD0-0008Kh-P8; Tue, 24 Mar 2020 14:07:12 +0000
Received: by mail-ed1-x543.google.com with SMTP id u59so20769695edc.12;
 Tue, 24 Mar 2020 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dcUgHF1GDuuSunaZUU4Ruocj0GZ4ddqSxRhaLtXqkcM=;
 b=dvJVWQ0O8hlSN/WBTtGXC50vG9ZJsG5B93vJTJkLUCehGXLNA7WiOPqhxSiXPhvxSQ
 tOj7bM0T5W9KTOferZhZUOyGqo0WT7kVcvYhb76IspBlhdKXyvZmq+EUoZfZwWazY1UW
 HbYAq1mKiuaFo5UjFpQvGh5IQ9HKyn0ZBjewWugORhupS/tsE3xXNBR5yGU6r03Ve3qg
 h82gUAI0taleDBc/RB3m/Q6cwpslgv65JWBeiWge9O2p7DlFJJ4W2u4LfLz3QJWoSdyH
 acqk0DLuJ/Dx8CbymfYh3loG/49JveFdfInVQkuMKAur2NH3+HUGXG+nlEtRaI8mCUJ6
 YOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dcUgHF1GDuuSunaZUU4Ruocj0GZ4ddqSxRhaLtXqkcM=;
 b=asPoBwG9pH+alKUnTa43TODmlN9hibPiFmjqywxKBf2v5tHu7l7mO6K6A3H+3tRCyu
 FIJmXaT7ecyhHsbaebLzb63Xh0s2cGgQj6uMKB2tB/JtFjIWLYz1Ahn866Py3wiGN8Po
 +xO38SYTkdLhsyo0gkJhZHjWb/MQfRm/zz/2hgjbd2cimylQ2WElDbxksZ3DaS+zR+5l
 KOUZURCoWiEL6QLUGsSJGr3uJvkxA6uKyJeUUbIMoYtP+ZehGYrC8Dhn4h02WggJOTtN
 HEUmBAvxHa6jsuCfcmQd9HSczjHWoPl9963mVMYLskSEGNZ1yV4qC6e1kQbdKMdXA4uf
 uvMg==
X-Gm-Message-State: ANhLgQ3X5VcXmc2PiO/zR6V5maQaSz3hP5rrnVvr4ze7tDuXejQ/iEEK
 aQsjTlw+LZY/6Yh2AVUEFI7BBiO4j2tLsUZfjxk=
X-Google-Smtp-Source: ADFU+vuGEjDeb/L8U1c1UJ2A93v1OboeO9Zew62wGydVRx2aXkWZiMP1AE1wliFtVf6Ap3fpngvz6Yw78DvnnxMnQcw=
X-Received: by 2002:a05:6402:17aa:: with SMTP id
 j10mr20114633edy.146.1585058828747; 
 Tue, 24 Mar 2020 07:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200324102030.31000-1-narmstrong@baylibre.com>
 <20200324102030.31000-2-narmstrong@baylibre.com>
In-Reply-To: <20200324102030.31000-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Mar 2020 15:06:57 +0100
Message-ID: <CAFBinCCaMopoza5CFCC7=mStH8Ocni4GjGr+etn=dMKOgr_5fg@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: usb: amlogic, meson-g12a-usb-ctrl: add
 the Amlogic GXL and GXM Families USB Glue Bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_070710_818317_2DF4928B 
X-CRM114-Status: UNSURE (   9.16  )
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
Cc: balbi@kernel.org, devicetree@vger.kernel.org, khilman@baylibre.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Mar 24, 2020 at 11:20 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> --- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> @@ -25,9 +25,13 @@ description: |
>    The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
>    host-only mode.
>
> +  The Amlogic GXL & GXM SoCs doesn't embed an USB3 PHY.
> +
>  properties:
>    compatible:
>      enum:
> +      - amlogic,meson-gxl-usb-ctrl
> +      - amlogic,meson-gxm-usb-ctrl
>        - amlogic,meson-g12a-usb-ctrl
>        - amlogic,meson-a1-usb-ctrl
the phy-names property is described below which you don't update
please add usb2-phy2 to the list of allowed phy-names so the dt
binding validation for the .dtsi patche (#9) won't complain

With that fixed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
