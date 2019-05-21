Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61403C04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 20:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E70217F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 20:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/CupMCS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e7lLqmGL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E70217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AplS/27swjn/KcGMldjlI6CWG3k3SpbCeFlmF7o9AJU=; b=R/CupMCSP+cd4s
	ryZPgUxmQhV42gjqF1xRzKQzgg4lRA63UWeHI/UOlvHq/X3GqEAJxgTFz/y9li1zv8X7NwSkAgRPR
	VurcaY7N70JJukFmm/SCfVthRBjESP1kk1mkcqfXwOKJ8OPVQdHByTrK/xI/WKx74FbUgrs3hsVXx
	YAf1PSdO04aOBRUlxGPGGImUjZi2wWjuWULxcNC8zR9cn82mJbZD8FaSW4wlKO060y+s/Fmr97nWc
	doiEtq1gt//UlPWDIGB4ztvDTXfOO1ImZYewCl02bg1AZftxrzWBXBsmactbiAErv7zmmd/dVEWv+
	esD8FrB58Nv7mYIo5e6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTB6x-0003Pa-0D; Tue, 21 May 2019 20:11:47 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTB6o-0003JR-FF
 for linux-amlogic@lists.infradead.org; Tue, 21 May 2019 20:11:40 +0000
Received: by mail-pf1-x442.google.com with SMTP id s11so145pfm.12
 for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2019 13:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=nSMrBlQQCNOdHw6ym1MsOYq9Zt6fXAndfJkhXIkeTfY=;
 b=e7lLqmGL/6q1XC19Pu2Ax/U8nYO6HgOcM34i3Lk6Tq8xSCi3pG3Btm/qAupy9SGITO
 PhlXnLDYS6PdXnZtmm2pjbBEWz50ShDcB9iSSs10VozP8WaB+I4uIdSBIpG9q5dAz3WI
 YgAEdRyN2VfdjIOGCNrBgtEGDEbpsEr5RW5EpUQ8PkWC4mPyiuShkB5vKwwqAjkTin6D
 uwvT4ssmU227YHH6pMdQnPKRLXTKgbLpPmrzOxA9ytRcvAqLosLq21vsenp8H2FJP52w
 75TfzHr8gm6lKBfi3ccb5yxWEWt6f+WFz9ExYdynGY+bcbOqvnZhhoRJd4Xt4M7WQ1dL
 m4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nSMrBlQQCNOdHw6ym1MsOYq9Zt6fXAndfJkhXIkeTfY=;
 b=YdWaiq4NmJ9U3cTRGNiHNKzep8mbHH8sKWCQaX3IVqKCNxC5NAGv7ws6FuIOuq3PQ3
 e2WLi2NEBkBpPppGhyCUJkknD412kj5c22vdzv9j+wJOcSKn0Gfp6IJHjEbCjoh/NLF/
 WF74uLgxcIEG9wpYkCmf0Ia2I2svRgzBxgSpLh4xI00k5l4VHHBp899tCMcCHXX7cy8p
 JNXZgWJbVgkI4OLMrHQpbCqdY6M5SLTRFJDVWyJSKxTz/yKKTlSrRKom8dHyODt9RfL3
 NQkNws5ofvtU2/4dNW67LZY3xM/oV2hkPocpeaScIVy5G+fqtcViYKaOv9czfw4Fgs1f
 m+vw==
X-Gm-Message-State: APjAAAWN2dxDkqTxZfWB55X2PaG9D8dG8ETDFGWipG7ogOCpIRjWw7UF
 wPeXYN8k+OURtAgtfYO+V4zMzg==
X-Google-Smtp-Source: APXvYqxQq0PW7k4iHfJLbysFm8N/zysY7W12kduhFF17wCTuZV0Kk7FyJlPkzS8R2ktUvE4NPm+YsQ==
X-Received: by 2002:a62:5103:: with SMTP id f3mr92089248pfb.146.1558469496412; 
 Tue, 21 May 2019 13:11:36 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:b1ca:3800:3284:d770])
 by smtp.googlemail.com with ESMTPSA id y10sm18575577pfm.68.2019.05.21.13.11.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 13:11:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] firmware: meson: meson_sm: update with SPDX Licence
 identifier
In-Reply-To: <20190520140045.29125-1-narmstrong@baylibre.com>
References: <20190520140045.29125-1-narmstrong@baylibre.com>
Date: Tue, 21 May 2019 13:11:34 -0700
Message-ID: <7h8suz7ekp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_131138_653242_DFD2998F 
X-CRM114-Status: UNSURE (   4.73  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
