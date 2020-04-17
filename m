Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D19C2BB1D
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 22:34:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC93320732
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 22:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CS3FwkPa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ub1pGCY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC93320732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNpTwvFr6y9HtKe6zEMfmKBqrW1OW3AeIUMq/W0UoRA=; b=CS3FwkPaUpecMA
	CyD4nJ3eeSAyfYrNDupV5d3QdH1YihJAbDHzZhPrQ6vRvk+fO9d2ElXMQRcvKfBYaB+fc1Ufkb6pH
	DOMbcrx4qEK6qKzs0MvZZEHzLSEjArYUmqt0GmeTtVqm6HDSuhyF124CQ+ys+MUTmfP/kk2Bxu7OS
	qaEzp13KzqQPEjEHz/kS6jNpFzQXUIbNw8rNau7cgZdNjQ9TGeVrtBF1CkHEkS+EiuXHhdWyD8xX/
	itmQtHSgMOGYNVYKJ/pXVqaZHMREN+lht01XD0Bf7kpZNLgTJ/DR/i7S8bv8euPAXxtgYpnB5U11m
	MDK8NN/cl3MsKZgFBvDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPZZM-0002uk-4z; Fri, 17 Apr 2020 22:34:44 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPZZJ-0002u0-89
 for linux-amlogic@lists.infradead.org; Fri, 17 Apr 2020 22:34:42 +0000
Received: by mail-oi1-x242.google.com with SMTP id t199so3465158oif.7
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Apr 2020 15:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qHIn6P6PIPO5fHJmJrNTN7uqm4EIFUngjpRx0WX0ReI=;
 b=ub1pGCY3C6DXtcpbBuw3krvsjfk57BvNqWSH4tJaj/a/gTjJWes8KdB3V3rhbTCl0D
 nW9DEj13uUfpPyGgdIONt8C3gfT8fnN8ToGn4Ixx3NDHVg9HSFQL7Tys+BRHaF1eZYft
 +Wlaj1CS4YXmO0KX0WXRwBsGv29lTIS+oPJyQlHayYs9K4MTqjoxfqFznainuJe0WvTL
 D43+nSOu5XSFxmvGHlJmh0Az1X8v4Ogp1AIiUr5lAxuhAY/JfP8PAB8qQfK8F1t8Guh1
 zLOa9QH992q0NUG2yK9gQGKrZs/hVyRYS84uxbtqDIZR4Zv2UuXPQcQm9yozTrWZTZRa
 sIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qHIn6P6PIPO5fHJmJrNTN7uqm4EIFUngjpRx0WX0ReI=;
 b=TyJEVt7xjUHhhi5QbygXuyoA0hSnj/c1eJmiQC/NkTRqKJCyTgCy5hTiO06xH0SaUd
 Y4i2Us2oIuoWJmti5TxG9lFnaVv2EkNGef7N+KgWEWsmZ/0DsZr84NPWIG1vfieB27fw
 9BesLRfsiJA049Au+BPjgJeJHkVAFA/y7s6Lbknkizg9l0x2WhVdqDpTS3UCwpLHXT1n
 woKZ++iOhQMx3WDTPt/xObM5DOcl/WyUZy9X0YT2s2vi4S2p8xfPkQWDBgADMlDtTaSF
 kpSfOR8AdVOiRjbyK9fV1p8Ti/cvoABQZ4B+b6wEsPoJpZUE5CnqCVprfDoYXYPPM2mz
 HbQg==
X-Gm-Message-State: AGi0PuYiZEWUaiuu6J60a61HETNOtziZ8oVaWhOp1PUPokUIQ7m3gInH
 Pr1eN/CN2IErcZAHzQ6BkhXnunKpeeJcP14/HaI=
X-Google-Smtp-Source: APiQypK+U9aJFf2kn3gWd6ZM6n/825UJgkfHB50B+AT7a9t53WoL5mZyOBqQC/AV4PeSedijgqXtG6UPCDRUfXcPQ44=
X-Received: by 2002:aca:4951:: with SMTP id w78mr3939817oia.99.1587162879288; 
 Fri, 17 Apr 2020 15:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+3zgmuFigPWmLZB9t6iPQEuhe_j0WBXbKRoKwr8LFYeBGPEhQ@mail.gmail.com>
In-Reply-To: <CA+3zgmuFigPWmLZB9t6iPQEuhe_j0WBXbKRoKwr8LFYeBGPEhQ@mail.gmail.com>
From: Tim <elatllat@gmail.com>
Date: Fri, 17 Apr 2020 18:34:28 -0400
Message-ID: <CA+3zgmv0_Am3j8-J927DC1WHeCK51Jn87aikbA_Cr2N-88yQeg@mail.gmail.com>
Subject: Re: arm64: dts: g12b: cpu_opp_table
To: khilman@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_153441_295655_03DE7B66 
X-CRM114-Status: UNSURE (   5.96  )
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
Cc: linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Please upstream this old and stable [1] performance improvement.

    1 https://github.com/hardkernel/linux/commit/f86cd9487c7483b2a05f448b9ebacf6bd5a2ad2f#diff-7af5a6e5d10416434bd0a5edd78f2a7f

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
index 046cc332d..1e5d0ee5d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
@@ -65,6 +65,11 @@
                        opp-hz = /bits/ 64 <1896000000>;
                        opp-microvolt = <981000>;
                };
+
+               opp-1992000000 {
+                       opp-hz = /bits/ 64 <1992000000>;
+                       opp-microvolt = <1001000>;
+               };
        };

        cpub_opp_table_1: opp-table-1 {
@@ -120,5 +125,15 @@
                        opp-hz = /bits/ 64 <1704000000>;
                        opp-microvolt = <891000>;
                };
+
+               opp-1800000000 {
+                       opp-hz = /bits/ 64 <1800000000>;
+                       opp-microvolt = <981000>;
+               };
+
+               opp-1908000000 {
+                       opp-hz = /bits/ 64 <1908000000>;
+                       opp-microvolt = <1022000>;
+               };
        };
 };

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
