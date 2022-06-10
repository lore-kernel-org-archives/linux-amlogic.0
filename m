Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5649C43334
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jun 2022 06:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAV/o4NnCXhzbaNZdLo5NWGCRM1hhNV660TQ2gcfPVo=; b=DUGhbMx6Ec4zBE
	joU+AgEo8d3JKNHcNMWqAzLHmOwMmXk6HezKGtmbb5GWtfwGOm/unsTo0L3WBfDrB3z3ex8dZZv+K
	KG1NsROd9kKIjCNy8pOPD9n5xW7wdy6g6Z2EBr/qr2EKO4IeocJa1Szn9BJByoHxIHbCHMvSgyb/g
	eLR5vqM7C7z1TNFx6CozzYKQ6zJr49kQsp7MYRC3XhM2jaFUcq2sV2GXPLWgj1IojvM7zGHVD9LfG
	Lgh90+SQlidG6LM8FMNuMS1SgeU3k1a3jdwQmj33/z7t2mo53EX183a3vrX3Pyl/zZEtc7bAgKjQD
	5Hks2DCc5Vau091GkfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYN5-006DiE-Mt; Fri, 10 Jun 2022 06:43:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYMz-006Deu-3s
	for linux-amlogic@lists.infradead.org; Fri, 10 Jun 2022 06:43:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so662839wmq.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jun 2022 23:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+pMYTdTOwcWkh7F/q0j0AiuTSMLZ7GoNW5PGLysPGgQ=;
        b=RY0+3FU0v4gL04KoZBho/SaD7j9RO8it3RTo+CNH9f+5KS/uvSeAfZCjs0d34jJGB5
         lsoRPDGq0g7zFmKVmMm0g1grQHXNaARt5wgIXnY/W/11KM+wTFGwGHvICwf8Ji2BKm2B
         irT9Uk2ydvgv7peGrN1GShuBnLBMnjAjiCdivYPNWxVrSF7gp7p3ilC9qi4HYXj9DA9N
         6hJmKhFeJbhMmr3htXMx6ng1NDUuitPa9w/FilqUhftxR6wBQwBwg6f8Vk5NxUWTpZGG
         jIq/cILt9VsVBgJY5KWln8kaXo/HJqXr0+Cn0wVHZNER1aTJ8xiPTs4kGi88gRT9H4n7
         2I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+pMYTdTOwcWkh7F/q0j0AiuTSMLZ7GoNW5PGLysPGgQ=;
        b=OAG8Jg5nsCstWJgyv1W1R3duE3X+lemslf+jSWCs+CbBVK8VM3MFinuiP2/mVt3mUi
         bJBsxm3PIqVTjP+0mJOOS9fqW/RLsPItMyfnVqQjQ+05qC+RX4jmShYqkCeTeC6oLenr
         cNr13winXDfmvdcsQSjrp2j5NHbbplNgXY6cbcmkMjSD7RWFebezdVyZes5gzR1RUVo5
         hrMacjZdbICsDG2FHrq7QhVz0g6/CGHlwqnzQJaPo8z55tawUMtrMMPBsDkeNna9ri4d
         wWPNgCPwTP3s1sBFM9OyhaAumcZ4C7MrGc52kLxG89VRWnwpe0qeC/5PciEKl9skqID1
         BQhQ==
X-Gm-Message-State: AOAM533KnQrsEG+9Dn8rEUhYHkuPU+dMKUpXh1AnZO2fFjAsmGwtMQLt
	lRBwDgNoLjLfnsck8UdzAhY7eA==
X-Google-Smtp-Source: ABdhPJyfRLX7Z45385BozdvtX7Q1i5LrdI5pS4W17si77omQpV9Jutm5XmEuywAMqOBLbVOjy6g81g==
X-Received: by 2002:a7b:cd91:0:b0:39c:4a18:1533 with SMTP id y17-20020a7bcd91000000b0039c4a181533mr7051332wmj.148.1654843422354;
        Thu, 09 Jun 2022 23:43:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:27b0:82d9:d0c6:702a])
        by smtp.gmail.com with ESMTPSA id i65-20020a1c3b44000000b0039c5a765388sm1799916wma.28.2022.06.09.23.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 23:43:41 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Carlo Caione <carlo@endlessm.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Miaoqian Lin <linmq006@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] ARM: meson: Fix refcount leak in meson_smp_prepare_cpus
Date: Fri, 10 Jun 2022 08:43:38 +0200
Message-Id: <165484341553.1385009.11750075420975194525.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512021611.47921-1-linmq006@gmail.com>
References: <20220512021611.47921-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_234345_184050_59E8E417 
X-CRM114-Status: GOOD (  12.50  )
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

Hi,

On Thu, 12 May 2022 06:16:10 +0400, Miaoqian Lin wrote:
> of_find_compatible_node() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.20/arm)

[1/1] ARM: meson: Fix refcount leak in meson_smp_prepare_cpus
      https://git.kernel.org/amlogic/c/34d2cd3fccced12b958b8848e3eff0ee4296764c

These changes has been applied on the intermediate git tree [1].

The v5.20/arm branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
