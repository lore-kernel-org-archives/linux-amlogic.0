Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81D1C6FD18
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Apr 2023 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7v2D9w6SiDdtZGHSvjLdjZFQCLsOPfz+X12x1ZpyQV8=; b=rhn8oF9R0vBR/v
	Hz4AqUj3pvBdrwogEcmVhoSeNZxWdjTfK6NW3rQSFLjWnEmR4yUPgRNSwUX6X6n4qrUbHuF/HDBjB
	Zh+k9Fgbq1xD4qGzyMt5PZsrbR+HFvUACEWdymSvv8zdnwWtv1tWvzCSfPt1RMvngJRw+uIUea9ys
	NADFgJSl27zhW716CsBoNGUxg5NgGgalnx/kt66kgSIeAGNl47FGSo42MSdqM52sAEIiQQMu/axtm
	WaVPXeJhMUUTuQPChMvxjStqJgkDsoYz0abJ4am3RFyRUaaCr9iv3k8isvNbMmxhHZskSWKY2SoJ6
	8txyTamR4cyqBSyvfMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ponqZ-002iRa-0F;
	Tue, 18 Apr 2023 16:06:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ponqV-002iQP-2g;
	Tue, 18 Apr 2023 16:06:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6F3E6363A;
	Tue, 18 Apr 2023 16:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97195C4339B;
	Tue, 18 Apr 2023 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681833978;
	bh=ePPAUY9dJOFw/kK4NHB+f5qypog9sXqimbRgdM/SBcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+udSpDHoT4p04HgM1AmuYzYBjhYlepMKYnmZH/3AMkwo8tWPH6XFHZzk19LiaBBa
	 21WYUi5QMqvdLbV0lzNAcVJ2kTu0Pi+lGC75tN5EVDgOpkM86/4Te/m7N5s/qAiUD/
	 oHdp7Nqn0hbwb3Ua79oEb4BTnlJlYrjf3qg98pVZZ1IdFRIjV72Yi55afQaCkRiAFs
	 Y0PRxpQT9Ymku65e1BWkZwEiJ77ePgQfDh2AgjbG6aEvHso6sv7/JctyhFaH0yNvzm
	 3u0i5yBYOPaPu70XRcXHXoF5cZ8cbUFmr6xe5Ov/gYmkLWSE7PRTyEfW3JYtFfqdtI
	 mXEMGaxWAUxxw==
From: Bjorn Andersson <andersson@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop unneeded quotes
Date: Tue, 18 Apr 2023 09:09:48 -0700
Message-Id: <168183418160.1484313.11791175608485998992.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327170114.4102315-1-robh@kernel.org>
References: <20230327170114.4102315-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_090619_927215_5FFE13B8 
X-CRM114-Status: UNSURE (   9.43  )
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

On Mon, 27 Mar 2023 12:01:13 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied, thanks!

[1/1] dt-bindings: remoteproc: Drop unneeded quotes
      commit: 82f2734d99d7e6a2327ff4e2122dd0db425b598f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
