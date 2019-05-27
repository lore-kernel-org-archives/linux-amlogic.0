Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E06C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:07:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60F6A20859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GEF5lOAT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LRJKerM3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60F6A20859
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3PvwV/QkAJ67Fgfe3IrDlgGxJCN9z4VZ2m9atVhxsI=; b=GEF5lOAT7v5xFy
	MxtHpAHruTkiSahfSoYZaw0QFkiuFFh+6TraTRByAJ34rMFIiSEFBsuRFZnoXbYrwaxB0EG3OhiVp
	vpYTnsFzcsTYNm087rW5SQeKvCp+VZpPIOzzmMlnKt41OOLnxgkmxv+WMUPKIW8IIRkik39GcWK8P
	LiCbYhvA6U/RqYazm5ieREI9ajdz/08XHsjJsMAMzo8AltYQYRxgwz1S3AupzRD6T1ZHHJfbr823o
	Vkb7VFHQnIr7spl2+B5CouGdbb9sPLHDBmeGE23LRQbVsybpz9eX85zOWBQ/rtoM2johJQqPnjWVq
	xQyaPZ23lb8Q7xu0nLEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK1j-000487-UG; Mon, 27 May 2019 18:07:15 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK1h-00047c-1w; Mon, 27 May 2019 18:07:14 +0000
Received: by mail-oi1-x242.google.com with SMTP id t187so12422571oie.10;
 Mon, 27 May 2019 11:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pgdAS9QmA+kymmNkQFCc70wQxZNKe+LAPHfdbYWWNfs=;
 b=LRJKerM3ylh4upd88+hgx1+BFJPM60FoiVq2gFGCKir4JVIqcEhMr+1Vv9o70obLmy
 6U0VbGoOKZadBoCid7j1cGTaS1D5sCGgZ2ekaEl3cJe7gzpwgIR7/Yh8VgJTREckWiH+
 Ct7i1tT6ISTxEbPGd0gZvd0kEXTbA0zK0tX1CMi3QwKTwsYcfYi6e9/sT81UXpfBF3yg
 g36U+vmt5d5jNr001ndEmF+/RMHx8uq/SmJJPewd6q/xoDpGCI2ApqRcl9a0w7uv7bKe
 Zq8OQOlwTMzeC0SaVl37zMMKWDCNpJxVBb4w+n53L3jtiJmeBsXt4bnDxxho/EyPfJhI
 vXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pgdAS9QmA+kymmNkQFCc70wQxZNKe+LAPHfdbYWWNfs=;
 b=jya+UxITNXXtCqXVKt8Mtt+R9YoVx1lAPSgGfcPcTEG4GORp/EMBtgyLM9TULHLrmp
 jSgcEVv+ftWFbzZMxASmMIgOj/7z7yGAlOQ9+Ir2d2JQZuE7PPNp5Eg6VEX8viJz7FWV
 1Z3bpRgICWX83fOpJrAdKEennBN+aKqtwPHCeWoBDxMf2E97BhNBFpf/HZ1jmLLiFwBl
 ktqkEoghR+8k8pss5X1QaE+63BcczxVsqmlvVfn3YiNL9U/Fsqc2SBmIlkvM1Dh0pBWL
 636pvdFMoflpm+HEtVDjgUeTfDUEC8UywLi3VHltnYx1bOBpdyAH3GhwByXugQ47QeaJ
 xv3g==
X-Gm-Message-State: APjAAAWSQRZM16TagCAZ8sveeV2u+zFpn2+dsxT4UNBOwPVeZ6nrCW+t
 cLAvivG8P3eL9cmhHF+pGxymAU9faYSUH8lAlV0=
X-Google-Smtp-Source: APXvYqyMXmtKIOU8ak7fRZzZtZnF43sZq/2nZIX4JJ6CVMqDmDlUS02YstvGsdCcG9uauJFg2OOUfWiobF2qL+dlXlA=
X-Received: by 2002:aca:ab04:: with SMTP id u4mr141664oie.15.1558980432356;
 Mon, 27 May 2019 11:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190527133857.30108-1-narmstrong@baylibre.com>
 <20190527133857.30108-6-narmstrong@baylibre.com>
In-Reply-To: <20190527133857.30108-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:07:01 +0200
Message-ID: <CAFBinCAsf4riNYLtJQeqTCZKwomrwfNYG1puTiJq-6VRK4Z_AQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] ARM: dts: meson8: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110713_091997_7AE1B51E 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:40 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> While the text specifies "of the GPL or the X11 license" the actual
> license text matches the MIT license as specified at [0]
>
> [0] https://spdx.org/licenses/MIT.html
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
