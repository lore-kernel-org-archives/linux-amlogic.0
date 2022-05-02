Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C07AC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 May 2022 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cB9td6AUnak/zbEtVlf//C1qcSuXggpVmiD/dXxn/VU=; b=bfoHEMRpLu3QFsB4wq944zJKP+
	Sy/Lj9y/vBcqgQRLlkzqc25SRXbtwYxgMMu54HRWcPUwJffsdat57P7jLyUnIP0py84kS2pqRUcOC
	1aizdfEhqqoOubAGRCROnF2AcA4D9EZidxAD2a/ecYw/FsfYS3zcOW42BOaxHdFDxkK1lES5ge3J0
	j2nqMLiMtmhYvowEaDpF531Sm4hqGuhW1XEh2ngUM9ADO+nZm3CsEoUaKVt55Qks4fAz35y8T5yyI
	t6S717rXNUVCNukIxP6aQPSOiJNi35fRP6uScwomdz8IHaGwH/HTZyKVvNFJtTQyoGWIKyQiQn4XN
	vO7E2KDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlVjB-001D6G-4Y; Mon, 02 May 2022 13:04:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlViy-001D1w-G5
 for linux-amlogic@lists.infradead.org; Mon, 02 May 2022 13:04:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id w4so19471854wrg.12
 for <linux-amlogic@lists.infradead.org>; Mon, 02 May 2022 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:to:cc:subject
 :content-language:organization:content-transfer-encoding;
 bh=l+lpIwlmpEOw72PQ9CIZhCPxkquv1lxYpNRC1XaOcPU=;
 b=ICMtMZ9QzKGXFRJJidQO/GVnfdp5ZFfvTZV9WP7loDSneiPKFZf4qNNhrSxOkHZprU
 eEFYE/og+pCCzV047mhXkMEv81G5bl81m551FwRGjtzV5dc6WTaGP+qMvNtNxrTOZNCh
 /sAMKvQhuQm9zeHKAuV1peTR5KGBWh9QyLdOmiMRcRyAYJJW/qiNCJ7tYYKBu5MzhiyY
 6yDwdrKfgcPshYyC17eapYIg+Y8YYhJJ75eVkhGeTxvuB4HLG9QZaqgXFeKpEkPFGvy3
 9jzWSKixrgM5KV8ElyWjWK9dVYHb45T4xFQvVaHQIIH2jqc/EkzaQb6pfy3dRonfwgCb
 rQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
 :cc:subject:content-language:organization:content-transfer-encoding;
 bh=l+lpIwlmpEOw72PQ9CIZhCPxkquv1lxYpNRC1XaOcPU=;
 b=qoHRdJ/gOFJnaPVfsi5tTYtusJiv3R+P4CHJ587+nje/NBg7U1Voeoa+FfTZxRXCxj
 eLNFLMIJJp1nIqgLKAh/NG9eNs6yhC1poj4npHS2vtRKdgLLqJ3gmbvOjtPdk6gBkVmU
 KyD7XxQHIWzoB5CIcI41orHLVx82o6WYdsKe7FvGvE0qYtpgjGnCmzDsp3CBgtKeAAc8
 xRbx1FaYIEphfFSzkBWHPQcNHa+0RpKhGpvQlv9lyphHYv2vaQ3UD/Wf9+gqMcP+qD8N
 l2qToB7ghkG10gFOqMvFJCmoIGRevgCU4Sit9CRRPs8xi8FWBDHvvXG7PPQxxx9+50dR
 8j9g==
X-Gm-Message-State: AOAM530eDdwXdyTq6tEd0DCOj0EOrAMMOEnfOVg5u184N5/MbGTSMcLt
 vz6hX67CK9Jg1OiqwJvXcWzB8GBr+FmZSH9V
X-Google-Smtp-Source: ABdhPJwqyymjOyz8O/r8s4IleRuCE2K+XMrTwktTnIfPIK5VjokbKRDG3AUj2a2mCUnAFKG1cip0aQ==
X-Received: by 2002:a5d:4b47:0:b0:20a:d4b5:83e2 with SMTP id
 w7-20020a5d4b47000000b0020ad4b583e2mr9236083wrs.503.1651496638698; 
 Mon, 02 May 2022 06:03:58 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1ae3:6f5f:320e:f969?
 ([2001:861:44c0:66c0:1ae3:6f5f:320e:f969])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b0038eba413181sm6414908wms.1.2022.05.02.06.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 06:03:58 -0700 (PDT)
Message-ID: <fbd7cbe7-1fe9-7009-37d6-c01b15c93032@baylibre.com>
Date: Mon, 2 May 2022 15:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Neil Armstrong <narmstrong@baylibre.com>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: dts: amlogic updates for v5.19
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_060424_560109_7FBD6263 
X-CRM114-Status: UNSURE (   7.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a single Amlogic ARM DT change for v5.19, aligning SPI NOR node name with dtschema.

Neil

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v5.19

for you to fetch changes up to e8662d0832431a069f0138da72c638cb6a377bdd:

   ARM: dts: meson: align SPI NOR node name with dtschema (2022-04-08 09:40:37 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v5.19:
- align SPI NOR node name with dtschema

----------------------------------------------------------------
Krzysztof Kozlowski (1):
       ARM: dts: meson: align SPI NOR node name with dtschema

  arch/arm/boot/dts/meson8-minix-neo-x8.dts | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
