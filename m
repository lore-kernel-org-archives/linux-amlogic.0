Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495CEC7EE2F
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jun 2023 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o8AcjjlPOJlmJtOdz20gnJwJfe517FIwqsylQ65DV8k=; b=OPlBI9EARtWO6o
	GjUXwEQvaXEqj2pDmffq4/UexnAXnlaX65jcFH5eeIHlG3nMAAchvqR0K8Tkm7RVCAMi+Q0yVItkH
	iUIhKPU/1jj6r3+vH7oqzOyI4zwHM4Qr98aq3uQrUMLVrDlAKPUJ9e/6BxdwAlQEePu64RqJeX4Oc
	YmL8sJyao4A9udlSCVLZmbBpicF2QS3Gktgv/SU/THC2szyT3Yf3ybiRLaC39jQv5jgvQ7yavY1LS
	CrbXHfPCWZPte0sYitNkibzLqoHfuGgEbz5wL/UL/Pt8WxTN1UCDsO2/vDUedZWELsWOvSGyxdx24
	oEuDfhCiMWNPoUBoSKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XNE-00CDbI-0A;
	Fri, 09 Jun 2023 08:21:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XNB-00CDZc-0G
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jun 2023 08:21:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30ae4ec1ac7so1002166f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jun 2023 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686298885; x=1688890885;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2dCiIKa1CN1LCvEj7Hvf0DLqYazkbxrnT1sTWjQkiw=;
        b=TFlniBTCzmmgJDIyTknroLwWTqUOsCnmSAU6ltTEY4rdLdPXgjpwf6Bi5RCpzyYlhB
         nAuUwwIG6eaKkFO2KhytHIyjo0LVDNliR3zF1jkdkh9/peJIFVQidFwM5JsRAcMQkygL
         PdY+AxPK2cp70ZMomp7sxrRAhqdGluxoTS8ShSv9IEbuLC+UfQ4v+9E4M5PEw14P2KL2
         ZWbA2nb5cH2xKZx0N6YVLl1Z/805vy+RDZ0t9LHf6Pc8BDk9YiugJKtQ1ZN3V8954YPv
         DsjBjaRlMo2Qp+i1/nxPD1+l3dfyh/U6vuyfSO8UD3zR+rXYneQWU/GSHaI8t6t5NM8C
         5bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298885; x=1688890885;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2dCiIKa1CN1LCvEj7Hvf0DLqYazkbxrnT1sTWjQkiw=;
        b=e0tTVLeZDffE4IK8E5S7ZbuBxmJ4nd86TtUaodYiclzvL2Rbc9TA4M9kSRnjEazI8f
         oxJB0nmHyLzehR20BWX3oi09qtBpWv5DbFsxONvsMp87Tcb3BazOzV+C49z2wzLHugqv
         P69lEqR4GXEAQMbTunvNTf9axkKCLO9kw2jkbyNPGc31mSnnAgVG+bt5WCgbbXuAVajB
         uQUxEQqq3knA1p6pVavjvxYSKWFW21m5UM5hcHqymJ4wcuD27ID2y3FpBeOUVwa6Smbf
         mIlohxZFcjGNH0EksWP5kmZ5E3+sh9+vP/5pkYmq5Y3/vuml8mpBov2dy6vaEVdC1Uzp
         c80A==
X-Gm-Message-State: AC+VfDw96KbTWO7WDN61kNzwvqROf0rMeDwmDhBK8HkxobCR1WRANrcI
	vLxHykE1YamKcueBV0BVeBfqUg==
X-Google-Smtp-Source: ACHHUZ4ttO6MVveZfyexVyvtG8vcoEDYBfmIpZ/8qqr4erVn6stbdF9GN/nj+HcroZ8jJKsaRHEgtQ==
X-Received: by 2002:adf:fa88:0:b0:30e:5efb:a108 with SMTP id h8-20020adffa88000000b0030e5efba108mr304721wrr.12.1686298885316;
        Fri, 09 Jun 2023 01:21:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c40:3a0f:b23:350f? ([2a01:e0a:982:cbb0:5c40:3a0f:b23:350f])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d6e8f000000b0030e6096afb6sm3803575wrz.12.2023.06.09.01.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 01:21:25 -0700 (PDT)
Message-ID: <37e5de2f-47f1-a3f3-f1e4-4a304192e556@linaro.org>
Date: Fri, 9 Jun 2023 10:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.5
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_012129_129819_BFC62A95 
X-CRM114-Status: UNSURE (   9.36  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a set of Amlogic ARM64 DT changeset for v6.5 with only:
- initial DT for Amlogic C4 SoC based AW409
- missing cache properties

Neil

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.5

for you to fetch changes up to 02310be6f080071e1b9e2021fd6dd655bd842aad:

   arm64: dts: add support for C3 based Amlogic AW409 (2023-06-09 10:15:46 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.4:
- Introduce initial DT for Amlogic C4 SoC based AW409
- add missing cache properties

----------------------------------------------------------------
Kelvin Zhang (1):
       dt-bindings: arm: amlogic: add C3 bindings

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: add missing cache properties

Xianwei Zhao (1):
       arm64: dts: add support for C3 based Amlogic AW409

  Documentation/devicetree/bindings/arm/amlogic.yaml |  9 ++-
  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
  .../boot/dts/amlogic/amlogic-c3-c302x-aw409.dts    | 29 ++++++++
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 87 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  1 +
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  1 +
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |  1 +
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |  1 +
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  1 +
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  1 +
  10 files changed, 131 insertions(+), 1 deletion(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
