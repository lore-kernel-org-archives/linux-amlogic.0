Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DDEC3DA47
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 15:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdaAf0kkRR697IRfa2kj3d4woUpnzjbT2RbOlUh+dGQ=; b=kIXlbrqK5d7hNg
	7s4trVxsg3vX+ORuGaldQvy0GuMOFB5QSXWkMHaBbxoTxMrYnYNN72gnsxTZVcwMPonSN6ROV1c0Y
	pWZl9MD2kzvbM5t5hVBDWmmZ+4inM0Fpsk7WfXaHM6ULZ1ALJU4PAVItiZSECeD4PLD/QIvv4H5sd
	NHZo091HVdzoG9n5Y6Qp4KEKoWQhLymdiDJjP9D+AxAIjSHMkwAAaysE74zf0+T40psnlsp1J4NrH
	imNQk1MdCbOqWRf4IAITmIbAZGnFls9Xh8wDKceyb0CLX/e99wyjpPvzmBPYTUW+cB50E4rYVks9u
	88vgFjw5PHm+DVeTyHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCm9-00000007k1h-0BuM;
	Tue, 09 Jul 2024 15:29:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRClr-00000007jvk-0YBW
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 15:28:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-36796bbf687so2954176f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720538925; x=1721143725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qggsgys4NITMh2ghLGb9NlRQPBQp9UFrf0DAdDJLM1A=;
        b=A29sFkPMCuhJJrXH/9uMOZff1Qh1wR8yi1h1ZUDhlpfeeArwT0Gpx7/DHTiwnq/L7x
         sNAGW0YCqDGQ3CdzgUAZW3LT3olFqs1gz64jSsfIpEz5HVwuY36FtqU0NM0KGBPjeS7f
         zb7XyslCcqzFUuD65B9KKoFVDpWIsSLWHUvbGQGnEioHmuBdePK35p1TrYXyGfwRC0jm
         Zs1JdngDq8119/rt/aB0/rFYe1+ahDjtYirKb/MJBV/hZMg8VrErZC1518dKRI/8TiFj
         Bp/wg3RuhY5DmvxgYNhlyd6i32ORqxRvU8JZxGhIwGesvuuE84ahovtqYbYAYGvSlpME
         iafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538925; x=1721143725;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qggsgys4NITMh2ghLGb9NlRQPBQp9UFrf0DAdDJLM1A=;
        b=Q+1ayhqG/RBi/KaDwUqJuQa61NM1ZzCm98puEBUpFPiCepgsg/8SXEMfluFE6zmdlt
         o1ps+riWRuurXUu+XFojmfb7rYPs1R63qXdAee7oyVd3Hwb1jJLMRJco2b+uPPVUlljz
         VWxJeMam1vLKFgcQ+YQgLAsWzObosRISYUcIQ4edoriiI2YFHkrIcH8uje/ai0IhcAOy
         UuHxVYrku4Mrpg0OgulMaKJoGIhnlq4D1HmN0ouIQe2EifbswFUwY4F6+XIzCU1Zowsw
         ZBSigFiyitElb2jCRJ6UQfqM/yT75u08JPeBnDPy+u/hHVU5BGbXqwtD9Jucy+4lA8ys
         AI+A==
X-Forwarded-Encrypted: i=1; AJvYcCUsGWvG3AFFm3oAvNhZPeFmeBp81DUHRUst9tu+unZioGva1aLS9YRml5JLLYj2vlVSiFOn79IiQ2XDiMN1IEQfYRkZkbYmbElH01sZcieWZuM=
X-Gm-Message-State: AOJu0Yz729W8VAk8VXlmwCwjiuO6C7q9E0lOUnXunQuefbD/oIdw8QJ1
	7chjDJyXxbJWaHSw5oZTlriJKGTGtzt96PyDPLNcnQzYA2HzipJfrFzgfIzZzz9pKlmP4RLWKP7
	qwt4=
X-Google-Smtp-Source: AGHT+IEVPnUlGz4qBOpMvn0Cp+wRKUUvSpZGFqyVY/8mj8sAm5oAs73VACcPAdVUmONzXpqsQCIfmQ==
X-Received: by 2002:adf:e412:0:b0:367:9bc8:8c0a with SMTP id ffacd0b85a97d-367cead844bmr1967042f8f.64.1720538925370;
        Tue, 09 Jul 2024 08:28:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab748sm2849119f8f.111.2024.07.09.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:28:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Hongyu Chen <hongyu.chen1@amlogic.com>
In-Reply-To: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
References: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
Subject: Re: (subset) [PATCH 0/3] Power: A5: add power domain driver
Message-Id: <172053892457.1166789.8670207814900707876.b4-ty@linaro.org>
Date: Tue, 09 Jul 2024 17:28:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_082847_231781_20E2D91E 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 27 Jun 2024 19:47:50 +0800, Xianwei Zhao wrote:
> Add power controller driver support for Amlogic A5 SoC.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[3/3] arm64: dts: amlogic: a5: add power domain controller node
      https://git.kernel.org/amlogic/c/c087cd0ef1b0c2adfabd216e28dfed242b5f4f07

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
