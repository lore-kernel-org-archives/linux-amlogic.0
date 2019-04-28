Return-Path: <SRS0=4pfR=S6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC49C43218
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 20:20:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09D8206E0
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 20:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UYn1KD2O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="YC37tAHD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09D8206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuZd8qjaNkCPB8wtr7uV6RjfQj96d59m2f8P+zFw+ZA=; b=UYn1KD2Ot0HTW5
	K9lwLHQsp8XbWFosj9ttyE7+iqfpV37q7Z8i/dH2yeliMusuElggIrn7Lbm3tDCWErUjOmkvggak1
	P55rIENZdKnQYydD71gpiU6g1C7943UICdMqDhfzjX2s/IYZ6WLDKVVcbsrLvH1vJIO1c0OQ7Ve89
	aAf6duJY9jIlW22ox1W6uSD9qfEMveLMb0O35AJdrwN+HEBRXWgTPUoK+HxQ9/nnD6F5HgZ+mGxri
	hBqprPmKTLMgUZ+b24FVApl0BL94k8Xumg4CcXbu3txtrkKw8wh/MBpgoaM2rVWnQrkhho3K8rT3c
	TVEKz95nSPNk61s3UaUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKqHU-0008Jn-DO; Sun, 28 Apr 2019 20:20:12 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKqGU-0007Bh-47
 for linux-amlogic@lists.infradead.org; Sun, 28 Apr 2019 20:19:14 +0000
Received: by mail-lj1-x241.google.com with SMTP id k8so7461292lja.8
 for <linux-amlogic@lists.infradead.org>; Sun, 28 Apr 2019 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i2toEMewsEMaHaLntOy85W6bAwXZHCjqEObm3jmcEHc=;
 b=YC37tAHDWBaDcJBRtp7LY9mB0b/tW5cYxvTNn139Ju97gj8+YbZBzBzg8243kB5ePd
 sXmm0/2NsE/xvOlAs5JjIGWAgMR11sLSxWDUEzUiID9f3NwDCAHAbCGTqxogCzjGTSLl
 cnCKjpFjKQhFU5LMatiT9Rf/dtfIQ1/N+biFtksGl0IrW1zwn+gxWKL4xtN9ruwdWV9e
 57g0Y8VN6f8mm4DKHojPXLMSeahOqDugr77dyiPzDZBIDn8PZ7SGJO88pBa/PUt0ni5D
 7G5FiyozoY235Mlsl9FLveMkzKMWBy9cPVJUuRZ7F/KOAcvIWNF+iAp1XO+04moAYIES
 oLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i2toEMewsEMaHaLntOy85W6bAwXZHCjqEObm3jmcEHc=;
 b=AFGSCB+nO/4ChJ1eVnmtpi/sMriwgCRUM5HtZm4xJIjt6ZRJZ1ImvSiyyjKbIa8+ba
 MNqx4FCYfzIhjT+cLTxpS9Ekie2KaJfyUeJqZimguN5NoX0i258NvCaLdSX5k5wZ3hzb
 GV8VrcmQd9E7pflXR9nXITOwhqKiYFdOuBMoj2GlBhQ17z3iaMMIWk+qpYLRfv2xw9v+
 9mRJe3kgtNhOQoKajm2+EuNYjSDLQudY+D7c/cZer85NufB7+yzucqIUwmgnPZ6yRi4H
 t/dQJd94fu/c6Oa5J3s70uM3STxLOmUpeYQbcv+47SjmvVeKhDqZl9VIxUg3zxOeGuDn
 AUPg==
X-Gm-Message-State: APjAAAWMNH7rRVTcgu5dYcqb0RLNPzaBLkb58EtIJb3iA7LZRqgeqqGx
 6hdq/9d0S33FwMzfmUZxRfH7JA==
X-Google-Smtp-Source: APXvYqydSMP6rNKI/oypKGGjP2STtKrIIWEqQI2PK2aIJKGEP7TZ6SkKHrmbTiOocOKLe840E37SJw==
X-Received: by 2002:a2e:84ce:: with SMTP id q14mr19610123ljh.80.1556482748431; 
 Sun, 28 Apr 2019 13:19:08 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id p19sm6942975lfc.48.2019.04.28.13.19.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Apr 2019 13:19:07 -0700 (PDT)
Date: Sun, 28 Apr 2019 12:14:42 -0700
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v5.2
Message-ID: <20190428191442.w2gd7dsi5cx7p7km@localhost>
References: <7hr2apv06l.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hr2apv06l.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_131910_572923_DE33AB18 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Mar 29, 2019 at 02:29:54PM -0700, Kevin Hilman wrote:
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64
> 
> for you to fetch changes up to e2cffeb398f4830b004774444809ee256b9bc653:
> 
>   arm64: dts: meson-g12a: Add CMA reserved memory (2019-03-29 14:19:42 -0700)
> 
> ----------------------------------------------------------------
> arm64: dts: Amlogic updates for v5.2
> 
> Highlights
> - new board: SEI Robotics 510, based on S905X2 SoC (G12A)
> - enable more periphearls for S905X2 based boards

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
