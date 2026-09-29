Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3A4C9832A
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2026 06:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2EgkUwuEA2Ba0YYw0Ab3LRLRYg0swxiZ2f7NcI2dQA=; b=Dh8EiuC0uYNNFs
	tyk9IVw9R0D5SHhbsDuYnuYL/YwUMRsPFFFsMR3LqV/CLFsCUwm1IbaXfnFkGcA49tPcY/BMxUD87
	/6DmGYqvEKQQ6JIpSZSpNjp+2Xk5dYaAGPjW3SZK8JlCcctEZrqL3lKuPBiVjSKOEhJEhJekXrlYG
	5uCDJioEAhRLszdXLE4MG30O8zyPFr9SH08yhXcTGJuChSXR6tQDZouIYxdWQHrAfcxc2Sh53rex1
	qecBX7BQZyLRQIZ70jGwYJEVD/NYUctFXxEPLnLi+IkoOf65qzzQ0feXDA1+H+ykGMnEO2tKTONHi
	oggopTiz0joTX9Sh3z5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR0m-00000002PNX-1aL6;
	Tue, 29 Sep 2026 06:08:20 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR0k-00000002PMr-00nh
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Sep 2026 06:08:19 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843378fb37so2221551f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2026 23:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662096; x=1791266896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=lbRIQjp1/H7NQ/Q8rfaxBSZYMDMOwwTbSGoGATuE0gJeXftMRxOnweyFmdh3m5s5Ip
         xt929v09x5UlsefpqA7p/BlWm3G1LHciU6exm7bKmPD3CVZidRI3NXeojj+wCGm1xYF9
         VdpM8RivLxrz7580p3l+UIX4RU4KOgv8n1tw4FNKG8iHW0IMp8WLHSlObRS6qoLyq99d
         1xrKxj+2PYaoaAz3B/7sOrEsVMHseVpaTQHqNjzkZf47mw5ggO5A0k0cmsOwERAHEvqU
         385eXaFpex5FEdTiyk0duiuCtpEdBGaEW9hXKNR7njXZHbzyOuYxHOPrWV8DJFY9l3Ef
         d3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662096; x=1791266896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=dWtwEipDcYPqTBlTQa5X1Sewl8jir44jtxdworRPIGtJzL8UakK3prDewXIQ2fLdoo
         oVO62OWLhgadZ7Ds2wMkTvpOpacZ/yG1Y3HBi5kfUj4pdQ9wb8d3tT6uTcoBnNyUduam
         LvpQsIsILpxRZEsnDEDWgVB4w9nSYErjzKSjcIj0R0H4mEtTaTQ4K6T7aUQeQPpBw/6b
         kkw5/3Dn6LcauBW5/qWFl+iBqpbMvZ9DyMTj7Hxnk4BdMS1VEngqgIrgFLfdICUgvox7
         b0lQK538BaDdGtEcRrl4X5l44ZiwORThk4MoDtAPFdsFdB79uelDbX6jTpckjq0j+7Bv
         oGdA==
X-Forwarded-Encrypted: i=1; AKwUvByhrA7HODAAvYJxh8Y3ZaV9FndhkluF+RDFGK2GwlJaifqde6sVYFwbe1REMDij2u+aqGSgHuYblKs5js+L@lists.infradead.org
X-Gm-Message-State: AFq9FYIIZKJ+tSecAh+4+danll5VBtqCkqO6h1iDfAcIvd5QShyzaM38
	cpR3IpWROuZvinOo65an5lBeoa9dkHCXBeT1lWdz7gZK7oc0Ufx7FLwU
X-Gm-Gg: AYBFou0cZtCPGFGxH+ruflQUHGhNCeV0ydoEPEcqN9F+yveJhxo9dQcvTaBX/7CdVPg
	EqVqMifRMIXHGF0wxSTYRtp0X7zVAFBqiwHb4OSwAlQF/uxwX7X8qGPlMxH5/S8bf5+r6QN3dZV
	S1jPzH4voCDpIsLqCVICJTQK3y6E9XgOcZWyim5PRTkzyGB7t6UZMyPag2/jxdpauedey13Sk74
	plPdw5J5AJzx1mXwbg/JHPDT3JK3r7yu1hwzeNE3rkziGeaC5TRgwuTIAbpkkbLL4lTYAUkrfQn
	AyKoIZntGE79qcmGW2z11bDitUcA0aMLn+tBBJUaODygdlB2H8p+DUiGiTwAHSLtqQpKAPzxBc6
	vIx+PLShziTo+E+mXrfQ5GjJL3LlSKIJMhrflgOrSdwAaDFquhoinQfgr4b/QtW1Ub06rMibO5P
	aKeTJcXtXYb75HpwCSTgBJfr7ijxA7g+QNfDtrEQa1EGwyirydruo9JgBUys1LZQRVTTOuFiSLC
	YlWxGwO
X-Received: by 2002:a05:6000:41cb:b0:48a:f511:e40a with SMTP id ffacd0b85a97d-48af511eb10mr783882f8f.34.1790662095984;
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4e8a332sm1628730f8f.0.2026.09.28.23.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Tue, 29 Sep 2026 09:08:12 +0300
Message-ID: <20260929060812.2041099-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com> <artQxRR3kJUv-mBF@stanley.mountain>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_230818_052615_012AF515 
X-CRM114-Status: GOOD (  11.35  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2026 at 08:46:45AM +0300, Dan Carpenter wrote:
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>
> It would probably be more reliable to just ALIGN() the width and
> height at the start so we don't have to do it over and over again.

Thanks for the review, Dan.

Agreed. I kept this one minimal so it backports cleanly with the Fixes
tag. If the maintainers prefer, I can send a v2 that aligns width and
height once in vdec_try_fmt_common() and derives bytesperline and the
plane sizes from them, or do that as a follow-up cleanup on top.

Michael

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
