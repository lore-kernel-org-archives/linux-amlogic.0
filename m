Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF8AC369C2
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Apr 2025 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QT02v3fT4lq9ac11qCPqy83V+todtONS1ek0J9KRpUg=; b=V2kg3YL+qmZSDD
	R/fboFPHXNRjWVb0QWIRX+RdE/MNIeCSqQW2RiLgcoFxlVqlY8QRUfTCCSZwAAf7gkH+aeMsA4Iis
	clNp1cyDZQLBhNNGCcVjUj1w0h6HOGT74Q8NDphQMZBFHESrNz60KNRC625p/90l7hWIVOA+upDE4
	JjKiuW89+1Z6OfD83p9LWa2ug09gOnwESFOJRCS/uZKnWGiPBWgWtMxbrmHw5WSvXT6vYAOb4eOvu
	YKLTT1ShF5Meu3crRFbOm6w93iZAVNBAUThD6iSmFSd7xAfKPrz2bKacU6SRgT6XWzJj68TRb5oaD
	HKdqsBlLjFl1/+fo903Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u796c-00000006Kzm-0zR1;
	Tue, 22 Apr 2025 08:35:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u782j-000000067Bz-1qJM
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Apr 2025 07:27:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so43240075e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Apr 2025 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745306864; x=1745911664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0X0JZ/sJPZkI4lLJkZG4Lcqmvumgx8c7FdFwse+1v8=;
        b=RwIA429DvvZeJVZQmZEXqR6WPjjtohtZkyg8FKwaEkQIGB9rTbvWz0AbdRPidvY7pJ
         R4BcTIn5b2cHy00IzCZlR3+r6QYW6alCCnjHiZic2Hg7OccZFXXY1Bzcz8FpyCsPocTN
         kotHTG0y8BJi3HpGDVXhVlZ5K0sPvX9vFbP0+3Hh57CXE6BN6gQK3ZeY/FLuZrVLVWJ/
         7OWjsnIejXUPVEnXYVeROfzCk6VvXB8TJxfBbK+cPY2K43qZBJBuX2v7yCI/u6pzG8O7
         MFzK1gkfjjKksoKdBhieRkNToaq9zpPCNWEhM/yCovbZKNz7xkGfa9zojP3tpHIve250
         yWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745306864; x=1745911664;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0X0JZ/sJPZkI4lLJkZG4Lcqmvumgx8c7FdFwse+1v8=;
        b=nwPu3eupX7wUm6dn8PyXdSAi/Fi2sjj7CMGUoMXrLdWGqt625UYN8AXFPprA4vpZR4
         T60qrnvyEytrweOEHij26jW1Ru25Ykfz9sSdx6LPtbIuHNg6qiuLBJrItwxzIpmk+vEk
         PEu7dBcv1oaiEujw/ECmXeUHsDDCzkhYA1xsifXtX6zPPM5bK0jtVEDaU+l6zVT3xqAT
         iM3P5aesp80R1C4dhb2sQeZIUTEQx0vKR+ajXE3P3KUpcM60X/KrYsleniyUhZtvjQOq
         G+dgqyIvXTqimOqH9JV0ko+I+iqRpRQTKD+QbqG9H/54bbhtZ/urlgkxJGxB5ApclJaH
         DNeg==
X-Gm-Message-State: AOJu0YxLvR5n5rlbqNfRTn+z94Riz7aUv12JzasGyaHVcv2t/aof9+fp
	UCjFXpYFq1EBvjRS7wv3u0uSg5D33gAMXoxtDu5x3Zb/t8yYjDvjQajO2SMzZfbZsA+nSomr8J+
	m
X-Gm-Gg: ASbGncv3O+0YYUshlCPkhu8trOppqGo030ULZl8J8WaOSF/o3JkSLadd4tqCTboMl/Y
	ISgkfYTdbkQepHA6zl1/XVrKRTtxPdYGmP5RdeUFzdDRpTRFsnuMR+8S9YozvxdOfzQ9c8Ww9mW
	6zWOczUhjhTDGBAu+y8gRRRaYBrSfPA9qlcOx4JMaVbwvidiFAqwApGIl2sc9lu2pOHYmnElBD+
	voeRXno4eCj0sqfwA4V2YAmMlLkzsRiAynWgMghFU3O69rZRsjoiAfx2KmoEeLBnuWfziDM0/tQ
	yNvScHXvYndGxEEo9T5XuIjHZqgbjR6EwVdwDjhcV7HBHjqdLxnFFvZrlpwzBQ==
X-Google-Smtp-Source: AGHT+IHWhiVi1ueArODLM6UBb5a4IpmaUoKJy65slIk54wuHnzDLgvlXzR90XdNucBZm/loWgUlT5A==
X-Received: by 2002:a05:600c:510d:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-4406abb2066mr131093765e9.15.1745306863720;
        Tue, 22 Apr 2025 00:27:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d7aaasm160798255e9.39.2025.04.22.00.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:27:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 0/4] dts: amlogic: fix FCLK{3,4} clocks for new PWM
 controller binding
Message-Id: <174530686316.2776757.4066244887775087849.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:27:43 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_002745_495784_47812480 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Sun, 20 Apr 2025 18:47:57 +0200, Martin Blumenstingl wrote:
> Christian has reported Bluetooth issues on some of his boards, for
> example on a (GXBB) WeTek Play 2:
>   # dmesg | grep -i blue
>   Bluetooth: Core ver 2.22
>   NET: Registered PF_BLUETOOTH protocol family
>   Bluetooth: HCI device and connection manager initialized
>   Bluetooth: HCI socket layer initialized
>   Bluetooth: L2CAP socket layer initialized
>   Bluetooth: SCO socket layer initialized
>   Bluetooth: HCI UART driver ver 2.3
>   Bluetooth: HCI UART protocol H4 registered
>   Bluetooth: HCI UART protocol Three-wire (H5) registered
>   Bluetooth: HCI UART protocol Broadcom registered
>   Bluetooth: HCI UART protocol QCA registered
>   Bluetooth: HCI UART protocol AML registered
>   Bluetooth: null: hu 0000000023fa9791
>   Bluetooth: hci0: hu 0000000023fa9791
>   Bluetooth: hci0: hu 0000000023fa9791 skb 000000003f7acf2f
>   Bluetooth: hci0: command 0x0c03 tx timeout
>   Bluetooth: hci0: BCM: Reset failed (-110)
>   Bluetooth: hci0: hu 0000000023fa9791
>   Bluetooth: hci0: hu 0000000023fa9791
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/fixes)

[1/4] ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/3409f843c04df9434beb637602382eeee90e0bee
[2/4] ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/a994b58f9d1163c4f559bd169721f0fc15866919
[3/4] arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/511d388a4007ba580feeb2fd2e9ba35a614c093f
[4/4] arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/a08b28c1ed454502abeb90ffa4a55445dae1d22a

These changes has been applied on the intermediate git tree [1].

The v6.15/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
