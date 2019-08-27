Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A39AC3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 17:03:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D27A2173E
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 17:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V+J5F8dv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D27A2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rS1I0uAopK8Gr/S6de9YZPUujukTAsW8iFXJdtMfmg8=; b=V+J5F8dvWmGkDe
	X7zFp3CYcSYdr5IiyhXGTb+SJer9WsMiZyn7dnVoq9XxYjNBxjwVejglDmRCHWwC5IlNw8MIViG9Z
	QH2ejemC5ewZPmICy8V60j4fSey9pGL4tgJGFxFDJj/kjwGD8pTa/Rv6/33PLDUivXgS42DT89uu9
	ELflN4fV5lZOxYW6CX+r5E8/QjgUCLxkUJ+gnRyIzEiGfdo8YBOx9Pgf1sP9pVjk3IGCnSHIcA+eT
	gMh3aVTScJ7HESn31697JvDelifosZjjTxz9+8sJiggj3YRcYA6v/xgFP7uls+HU0LLdNAxkriLrS
	38MmQ2BqNdEBMjGELufw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2esQ-000450-Qn; Tue, 27 Aug 2019 17:03:26 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2esM-00042o-Ui
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 17:03:24 +0000
Received: by mail-oi1-f194.google.com with SMTP id q8so15244130oij.5
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 10:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=egAsBZONFtZF3S68zAxV8vWm95Rzuv+SSezbehwAtCw=;
 b=c6rGM/fzFxtChO93FYMPRUsFZ5piLUGhmE3iIGnOEryO342zJQPYpZKpmE+4fUsYQJ
 g3PtC82d2PSyzmurJ/+TGUDpkZJuzLF/pbW0WsWT2uSBMjmqzzxMBZuvJGWQaGL7fjwM
 /EVt5hF8l1AFnxnIE6f5TKfeXMitRRJZTAoXAi6+9FDtEmlAxAJrfCY8Iepa7B0ceGxi
 U+IR9rejskhwzBR1O5tsf7hX0LDJBPodM3EEAZDFu4ShRza/EG7JhT/zz375/CET+1ll
 CbQUDPPcQwJwNTmmzUWGMzWdN0vAgHecCGZIwnSlq6yMGtETmWdlp5KEhFFIISIzF4lm
 viiw==
X-Gm-Message-State: APjAAAXMwP2CHxjW7aniRNC4QopOT8o0diYYEU5xuYEgxDcAxo7ZMIpY
 fdcjWgMZ9C9rASUl2R0Fpw==
X-Google-Smtp-Source: APXvYqyrU53AmLJ9RXIkWnzQsmP/nOlBksyu/9B33djgdkagficaUAD5K6LSF+6tYjKO/a4cSoIbMg==
X-Received: by 2002:aca:b303:: with SMTP id c3mr16045895oif.95.1566925402020; 
 Tue, 27 Aug 2019 10:03:22 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s24sm4246237oic.22.2019.08.27.10.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 10:03:21 -0700 (PDT)
Date: Tue, 27 Aug 2019 12:03:20 -0500
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] reset: dt-bindings: meson: update arb bindings for sm1
Message-ID: <20190827170320.GA13577@bogus>
References: <20190820094625.13455-1-jbrunet@baylibre.com>
 <20190820094625.13455-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820094625.13455-2-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_100322_990075_07A6227D 
X-CRM114-Status: UNSURE (   8.03  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 20 Aug 2019 11:46:24 +0200, Jerome Brunet wrote:
> SM1 SoC family adds two new audio FIFOs with the related arb reset lines
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt  | 3 ++-
>  include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h        | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
