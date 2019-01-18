Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABD5C1B0FD
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 21:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F212087E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 21:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IL8BoE/+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jLZxN8YF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F212087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiGRaIARrS0XjF5DbCyJVUa7Xh7TzJjGmnqJOffvKLM=; b=IL8BoE/+g+ebDw
	2B+MF4u+X3OsIeYtlPEDOrbuyor7LYp/ltYxz8wkx0Qc8/vaNf0KjmrfnmhZMU5nmJfR2fAppen2P
	J6d5/ZEum7sPXYJUrGy9EXu5LncxgoKi5haDN8W04lwmyMboN8iGkrm9wLRTV8JMDx7qvS9PQGh2s
	cZ1EYZuiyXo0tjI7n4EZKdYA48pVulc6z9KPvLDJkb7rt/LeTjC7wusaN6qYAxdrgIdpXVQthqqZh
	Se8AuW6hNfPgmunNkY3pcQ6YZBwE+Gx2JTO37AtlgRMZ4j0lHnnRti57aAj7BqHSv3xS7n0R1jo7g
	I1/ADznFNcGgCItnyODw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkc9R-0006cQ-RV; Fri, 18 Jan 2019 21:58:09 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkc9O-0006c0-WD
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 21:58:08 +0000
Received: by mail-oi1-x241.google.com with SMTP id a77so10143330oii.5
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 13:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wzU6t1Dt7NW3z9OyLSLM1mvqbluntTfKi+oSjEMCJ3c=;
 b=jLZxN8YFt7DA6h67fxza6sFDdpTjHbOwI4CoR6ZXM6jz1uPTeK7s8fR53814UykLMB
 BeobnUAjRGkY3FAb02tqn3nLMmUk90lKFlNvNu/b/G+WL0typyBk+eLgIwdmA8Vmqrre
 NSFtOHY5Wu3eT3nVL/JABLnI1GbDVKyWQ0x0E+luVUULeUDfmjsTvp3bEe8dFgJR6NLU
 F0kifxpvQfJ8ZwuR75iR0Bpoe7D9q2cey0rw9KP/9nVQYcQrKFcQMgrr2+VrrFNpZKCq
 Y7mp4a3hja0jxox2GByDl5zLdOOgL5I/lpJIfiGyABwzi/ZvPDqC43KfApJa86ZuVJKr
 6IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wzU6t1Dt7NW3z9OyLSLM1mvqbluntTfKi+oSjEMCJ3c=;
 b=pV3foSfOLFgStyO7mz+6ZVtxnBaKeZNx0RxExOfRF4a3kVUCzQENmUeE1irGQXNnOZ
 o2bA1GgXb7bjDziR8ii5q6w9NBB5LcikVVhnF8ASetbRlEzlUHa2TNGc62xgGz9n2ISG
 g/uoI9ztJ+cxxEfwL4rGDfcCkyBcoElXaIFFyfL/Q9ANAw7UIMDgSoVqYj++exgFBzgQ
 iv7HU6F3z9hzHLiqdP+Gx4VrVRUyFvkqo4l/qvdBc4O3Za0hFqfwo7z9X3JyKlWHVsKf
 vDWU1/9Avk97OOOYVWw5ylrtLAIuGQs8S2U7H1txLyvqb+vBXMbfJ5griYZDuy5RdsLk
 yZJg==
X-Gm-Message-State: AJcUukfWUNOPA+KUdEsBnvR9H/+uxt9xOeJbuinwCplIS9InYexYK008
 tDC6jqi8wKslMMMi0VQnbeHQUHYUYZmtisLA76c=
X-Google-Smtp-Source: ALg8bN7vxHg1nhiDiWNoJEMgG3/cSI7VqTbdORuDOrpEOXE0d8s6ROSVneT4dfDUX7l+c4JSZis1LzVn1Bgf/GMui4Y=
X-Received: by 2002:aca:e884:: with SMTP id f126mr1751681oih.181.1547848685856; 
 Fri, 18 Jan 2019 13:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20190118103423.15075-1-jbrunet@baylibre.com>
 <20190118103423.15075-4-jbrunet@baylibre.com>
In-Reply-To: <20190118103423.15075-4-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jan 2019 22:57:55 +0100
Message-ID: <CAFBinCAi70sfpWqiSDorN4ds5eYGbh7GVuU5qZ4Ak3myyYPe7Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: meson: axg: add clk measure support
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_135807_039014_68E24DEA 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Jan 18, 2019 at 11:34 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the clock measure device to the axg SoC family
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index f044473dc7d0..398b7ac1b107 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1610,6 +1610,11 @@
>                                 status = "disabled";
>                         };
>
> +                       clk_msr: clock-measure@18000 {
thanks for updating this to use "clock-measure" (for consistency with
what Rob acked in the example and what we use on the GX SoCs)!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
