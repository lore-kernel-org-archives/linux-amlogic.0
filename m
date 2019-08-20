Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3444AC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 16:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0689B22DD3
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 16:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1t0ajrQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hq3LvZjF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0689B22DD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHgx95BD0cX5x6e1HRkGh9bGpaJAoDvoHdfLs2NYons=; b=Y1t0ajrQ4zuwS2
	AOji3f92Pgq96WsB2jJamXyAkCGscA2h3uwjawPIKPFMIvmJaNLf6ZUSZ/Q767C8HPnS7zzHG9mwr
	J9AcAQzZPT8kCvdq2S2e4+ndH2BLr73IUgL2FDIt/nPKJtLeaxR+uaYmMAx4jHcSdFUDQ8n+HJWS4
	cnhMME1Kg3AOF2kQW6Ez6Ru52Tvj2O23l1AHd9ZPjXZylkwpqUvhtyptYU9pzEdNq+vD1Pp/Bb+9O
	YGqAC3KyK7zZS1rfSiQkor3jXKIkdWgw9RqSx213OD9PQhSBiULcoBHrdQbhDJJLIhNOBROQTGMh6
	SU7apI/Mu6iBSCQUZLTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i06np-0000Tc-Ga; Tue, 20 Aug 2019 16:16:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i06nn-0000Sm-0G; Tue, 20 Aug 2019 16:16:08 +0000
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0514D22DD6;
 Tue, 20 Aug 2019 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566317766;
 bh=o+9Y1S8EJeybPB3/XiGd1VecFWcI3U1F/7ifdtRoKzQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Hq3LvZjFfnrBR33GHefdlaXFKqMqUujeYNw2kRo6h4AY/lH46aepgIsEYj17NJaEY
 d6B/fUXh/S7aVrOkFzKwupvPvyW+mRANSNf29yG8OQCAjwpbZOw7mN5hwHQTr5v2Gn
 FTSZ+jbiwvHthFu3wAs1dOgwtWnkrmiBHqzFL7Ps=
Received: by mail-qt1-f170.google.com with SMTP id e8so6644354qtp.7;
 Tue, 20 Aug 2019 09:16:05 -0700 (PDT)
X-Gm-Message-State: APjAAAXRjbn4FZlk9ccLGR9GXZ/7+f8aO5Tg8NZsMVM9xOKgtowFhamJ
 UfocKVgB/hws2mnpY1GUil6awH/a9Y5FpnoaiQ==
X-Google-Smtp-Source: APXvYqz7/XDtwS8pKWW3WNm/atXtEdgaMroF8d1FCSG5RqKVSlW11FfeZTvwkmlYEEwGR9WC60bpQDx079FVVKGuyUQ=
X-Received: by 2002:ac8:44c4:: with SMTP id b4mr26685231qto.224.1566317765244; 
 Tue, 20 Aug 2019 09:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190820144052.18269-1-narmstrong@baylibre.com>
 <20190820144052.18269-5-narmstrong@baylibre.com>
In-Reply-To: <20190820144052.18269-5-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Aug 2019 11:15:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFBcstWfaG-n6k9169bF0o7DDq1Uy6EcTF4p-Ta_DOBA@mail.gmail.com>
Message-ID: <CAL_JsqKFBcstWfaG-n6k9169bF0o7DDq1Uy6EcTF4p-Ta_DOBA@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: arm: amlogic: add SM1 bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_091607_069034_93B89549 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 20, 2019 at 9:41 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add bindings for the new Amlogic SM1 SoC Family.
>
> It a derivative of the G12A SoC Family with :
> - Cortex-A55 core instead of A53
> - more power domains
> - a neural network co-processor
> - a CSI input and image processor
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
