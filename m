Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EE5C282DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 19:46:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E940A214DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 19:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eR73TpA2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="beicCXg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E940A214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esSP+4iBMhpMSwel8kTscMt4fkvQul/xcDvNtG88tJE=; b=eR73TpA2BPpLF+
	jdjvTP0WVsp2i1ce/2lXGZ14S8/VD4ysSJi0/W0ZxjuKxosI2gRCeoXojWgFgZvnyh7qZaSBhS7Uy
	UPpMX1CQhcLi/dJTglRi+2ZsncTmRyWlF+1fT35P2pwSCbGy9dH5HA/7S3jIitz7ubY8BWPzvoCit
	7QKZEg3kaXtCYehJdQd4iTk9Oc/0NmehGQWBwz/nHsBAshlI6QqdSpU7D0TkOzIV/3bkWHZynowGl
	4YQWzbNtVSVuP6z3YUcNRKvNcOwoMVR09grlUGsmHubAbtqE/k4oMMX4R3LmU5A46M3XkhgPBr6VQ
	jy+k4KBWqEOONwJdpr+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHCzE-0007gH-8H; Thu, 18 Apr 2019 19:46:20 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHCzB-0007fr-Gc; Thu, 18 Apr 2019 19:46:18 +0000
Received: by mail-oi1-x243.google.com with SMTP id t81so2508139oig.10;
 Thu, 18 Apr 2019 12:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KEouRq2XUIs+Kr06PT/8QxB3jpIE8DhcFyEyTbtMjCQ=;
 b=beicCXg+Amiwz2mmQ84fr4YfmKHW6jK/2Bc/vwIFTbt/BpqZf7qqc93W6zvr4497qb
 WR+zyWY7eqVWZtbK4/TvcGc8qvs6rZWrcgFwTPPAVeLiMpuAZhS8jgyTaHUtCVKwGPLq
 eid9YChk542PGYfNfrA0skHLMecRZNQcSJdcP3mE1XYk7ZQGUeqinM47Eng6zIZ5i97m
 o257IbKHmFQTMgLrmrNeSc6YXtNzNxu+UJVpQCyG93bZfF1G+LiN+4KMNPoPCFacfV+0
 GpTeBbWrcM8ZfOSH3x0xGj1aFHggaJeGwB+vtO7NL6PbGZtKWcMdtmomaFmmelRbXY0r
 HKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEouRq2XUIs+Kr06PT/8QxB3jpIE8DhcFyEyTbtMjCQ=;
 b=nZ5ZcCYJNI6oP/eZgDl/nffNR1umR5gctL5uuYKbFYjwWZdvQTO11Ff2xQi6mitIMX
 wM5krZf8q7EPGf9Zo2Zn6OjOlwH/quuvrb/cthlPuSXWR2dkVn9hBoTCO9LFOC/BPW8n
 Fpy3KUL5roz00jEl4EkZwqQo+5XJUYIbUsBVxRUu3sU64BPCE+yGGcqXM9bra0wr4jft
 V98wjRtQkl0R7MG9xZNGrpnqHveOputj6YbDVIzvwgNFHDea1f9T1zeAedd8yeDVESH1
 fpllUV/LleZ/QHpkLcsEJt7J8wy9FV58qwtSR5nzdqSw6lTItAWr/nUmW7VB4I7tAr4M
 WWLQ==
X-Gm-Message-State: APjAAAXTfYZoucujHSFufIlG30PeLaWGsg4xCOLmy0VJM1UUArz0HL33
 k/U/zUe8Pz5/oKw9g7XFBuRFDuv5SxhSYa4Z6Tc=
X-Google-Smtp-Source: APXvYqxs1oz6dybsrDbrWbS2iL8KEBfBl2fQ/eR5Sv9tj7ww+xJszPzMqkmfLSvyYXxwryiR2CnMJydyyfu3FK1BHKA=
X-Received: by 2002:aca:4482:: with SMTP id r124mr3314554oia.39.1555616776408; 
 Thu, 18 Apr 2019 12:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190418122714.30805-1-jbrunet@baylibre.com>
 <20190418122714.30805-3-jbrunet@baylibre.com>
In-Reply-To: <20190418122714.30805-3-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 21:46:05 +0200
Message-ID: <CAFBinCC3+VXwmzCQFL+3zPbi1r1PK6StfaXwT-fk4ogGqgAXRg@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_124617_550825_7BEAF848 
X-CRM114-Status: UNSURE (   8.13  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 2:27 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> While some 3.3v eMMC 4.0 are available from libretech, Only the 1.8v 5.0
> modules are recommended and supported for the aml-s905x-cc.
>
> the 1.8v is provided by LDOs on the eMMC card, from vcc 3.3v
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

(I don't have an eMMC module for my Libretech-CC so I can't add a Tested-by)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
