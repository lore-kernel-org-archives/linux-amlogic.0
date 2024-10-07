Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC6CCFB45E
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 20:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmTJS8tTzEhYMiiHCyDXaB/RdwECY0jkb+maWlI2WyA=; b=QDJPeDaQ8Pyn0d
	7FtreneVd1ZRq5ZliuxT462zLiZq4LMcsJknbJ4dr7O5HJB06en2aw8sCHtNoovZrHL1NzMg7hft/
	vg1oDW7TNlbPctWI3GFHapa2C6rcJbs9NDqUFFvEaqrrYBeC0FMxwoJbHxU7ML1fx8oX18lCbum9O
	MZntW5MUlamc4xcfPzyJUfDKe1L5ZRlaSqJhI4MlB3WgVstxIi2X0f7zW1U5uSFXw01zPHgcWoxIe
	idcIaUuokP+h5evbLPJcoVPyoGWUszsIQN8lugLdnLm700nZH3WfBzZf9FYozYTF3m+qoJwewPp8N
	cRW8kxG0SKZrnwziO3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtym-00000003gyY-2H2r;
	Mon, 07 Oct 2024 20:05:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtxw-00000003grS-1Ipm;
	Mon, 07 Oct 2024 20:04:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7D6EA42579;
	Mon,  7 Oct 2024 20:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB09EC4CEC6;
	Mon,  7 Oct 2024 20:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728331463;
	bh=zMuEK/+LlzrBce+U/LzRTcJ//VPj1HV7lbrBSEf7RLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJc/qEe8QWUHpTJAB/2vMtKcCCPLDPKqhGujEcnsY+syGQPYh6seMeeJ8vpd1IVeH
	 FIqAvFz6u7NXEUmDp1jbGaRuaElNQht2OPpe6rrSHtXS4hzFixxSjVoi2pT4fP++/j
	 ulkuL/w+gTB1TNIw1uuWrlMY3HJ+v1Ykx+6XNu0D9geydwdjo5uTIDlFyVrzHbCHMh
	 SncLV2kQ9DLngGCdbiqfxjwI1VDL/aN9AKhUub5xfE6djnT9tH3i+e88cKnvBIK8Wz
	 Fj10FVHJIZRE7n+ar+4yt3OpiVlHi7zbT/KDzzYHui1XkH247fArCb53hqn1kgTlJI
	 N1T1hFOlYerRw==
Date: Mon, 7 Oct 2024 15:04:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document
 the System Control registers found on early Meson SoC
Message-ID: <172833146176.2311218.15217658645332069046.robh@kernel.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-hhi-sysctrl-meson8-v1-1-896b24e6c3c8@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-hhi-sysctrl-meson8-v1-1-896b24e6c3c8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_130424_435163_E65802F6 
X-CRM114-Status: UNSURE (   9.15  )
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


On Mon, 07 Oct 2024 16:09:38 +0200, Neil Armstrong wrote:
> The early Amlogic SoCs also has a System Control registers register set,
> document it in the amlogic,meson-gx-hhi-sysctrl now the clock controller
> has been converted to yaml dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
