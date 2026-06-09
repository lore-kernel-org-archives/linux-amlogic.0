Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00388CD8CB2
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2026 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P99RSjNOul3TrP1kEiZImR9NZDlP2BXOFBlU7dXeQ+0=; b=fO8w5rz6EnwZK1
	wuiYrt92jFwmE4ZLjAd1n/92/7cIt+FpMUTYGLCWm0nRKVGrWuH3/h2AOXmjrMCg8FhtaJs3cUWZw
	8kEOcT90Px+fxNz/9/ZnLsFSaZJhqPbhZLeRp9M9uvXD9ddYkOjYuV2eb5fwDuVFFn0WJPcpQWRp+
	w7xWJJyZoryV4j2Hbeos6FtL5kgMu+VoHtWJPocfkx/d6fxLfA2VB6hnsuipKlyivTd7muTpJix+q
	dGps7GGI8qTTR0az2jRB5LS+dsmwur7glnYXl0DTHsHTY5z7WFS51UT1+AGnEuBUW0FW/fBdsZSEA
	+SpdIzKAv5eC/eBZ/ggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzWJ-000000064YH-1dBR;
	Tue, 09 Jun 2026 16:41:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzWG-000000064XN-1FS3
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jun 2026 16:41:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOiuS2750372
	for <linux-amlogic@lists.infradead.org>; Tue, 9 Jun 2026 16:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+SJ1odAbeV0uTMzVMi5ad2jR+3gn11BCR39nm6EOKs=; b=QBlLSGej2K0E+f/T
	21hcAjzBrBx/5WrXDO1EWdVmXtHAKkw+lq3CxaKIsIKt+sxjRazrqvhJ6g3HcvXm
	rtyicrP11SYYMUmeCHltMUiUSzt9KjV3fixwRPY+hwH4ENjVLv32g2nFq8tTGQ82
	+oTjgne6bwvjdnui8flGxRH1Mdqp/OHow7tIxabFNlDVvZKJR0CsTYNWLn1cjKXA
	NIy0hWDtj+XoBarJd17JmXggrbGJ0Ajf0PTxHcJgGLhYT5qcy7qo3u6rxlZyFaKn
	pIUi6WlRB/7owAR1KtEf9lN/SgRRO0fLkRRLliK1hm3uMsBOP+dij5k81KNVpD2R
	Cy6wkw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgjkeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 09 Jun 2026 16:41:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b35fa876so70215745ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jun 2026 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781023299; x=1781628099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+SJ1odAbeV0uTMzVMi5ad2jR+3gn11BCR39nm6EOKs=;
        b=EVAMOl9bg8cFnLPjIFHkaarAAtGwC1YTK3dxorjG68M+16zD4tP4DzD/2VrWfGPp/v
         XmAIyAov1t79vRmVFfgI3WvgCEuWPA9Tp0NiohzbxZDUU9cfDO4eMtwgzgIiId5dypFU
         dYpY4YJByiJTI8/VVtvAFlpmhvDIm/GID70l+BNzZzPOJM+e7yoimmtFnWbMTI1Dp7LV
         3DH94DUs6ke23nqaNA5AWfD7vZbXr3izuzQqexk7zWBUgQz5dtdCSYfl9AU2W344fTWP
         JBxMOoAepGAHkLNA/TXLAkg1KjOWDwEQhexkkl99uiwq9FFIRm6wAkE2yVN4sZfvux5j
         ogvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023299; x=1781628099;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+SJ1odAbeV0uTMzVMi5ad2jR+3gn11BCR39nm6EOKs=;
        b=BmcquYSgenx3wCG5H6UI8Eeqghx6ngxi4xr5uMD+1u0etCfDWQ04Dlg/XcGk27kM9p
         cEFfENhtLy0Re7Cf9YpMBrzFhXgW9bcGvT4A9KExPz/UkAKNOwckGIR1T9ahaKOV8iZB
         QL5JWPVWgmF6PTRbj9wRi1ZkRg8+cY3rfPj/du8XXhwMVD4nJDnFwJk/1gu9fs8WjsMx
         ufkWIXY6siw4PsKmnRIl/TE87Fr7dNT6345KHDu2eP4Hc9yF/kEq4QwWcd9gXzO1NLNE
         GYMQ4aEvLkdDk+Lo1zZczMNPO3pWhTSwtc2m7k8kMp4SnLqQ09MKHujfW6qkcMkE+9wc
         bL8g==
X-Forwarded-Encrypted: i=1; AFNElJ9B187s09ywoSh5NiyW+aYWAAe6ZCvq9wk8JFqPuDYX7rl7X/OY2P+SKK5gN1e/TdDhk8t6vcsjejjRT1Tm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4MacYrvOmWPchhYpOwN365KgjGDlhGLODwcklAedqBwk/4JuV
	OEnDjhccK0VxnonKAXe00KASm7qePIiBsVKbfQyZPyxn5FiM/AKOUweLwAK8PvU4REVXkHzFzAS
	J5AVm6MFzUmqIxfRREZQ9O4Z1E8ifPK8uA27SfqO+wPPrsx3Or83PCiI/KmaEDZ8BaaD8xeaDyW
	7f+zdB9A==
X-Gm-Gg: Acq92OEdiQFug8j/926fzYgQZuooCQXAGo7BiWVPP0fZ/6aULRMYwSpPYqTJJlDArsr
	EO9zl/pVG5dgyfF9T+axPzaDACXkyvMKmTlFeUAOEHt7rF1tPzF03QCLtbW0Lf+G4Z/rj0aOVAe
	4lG9PMk+G/uyldS9CuCAKCAlIQLYClPHKkRcP2elR7vobrmxzhFqQGMJrgnkzk3rCW8yFQWvmN4
	pCoAFQwAFqaen6HP1Hv/5UxpLApgVkRYHjCiiAjmgegRckWprjxyRaDY768X6VHCkR22b1VyCD3
	a2YfHX7Ad8DQrD0xidO3wiTm4QxdSitIOZpN396oYcPHFb+151samaao3KMa4aIijx+jby+nFm0
	oiz/rOIe1Q8H7Ez+agfuP4eGqdQJ4hBU=
X-Received: by 2002:a17:903:4407:b0:2c1:d49c:8398 with SMTP id d9443c01a7336-2c1e78df934mr243154275ad.8.1781023298984;
        Tue, 09 Jun 2026 09:41:38 -0700 (PDT)
X-Received: by 2002:a17:903:4407:b0:2c1:d49c:8398 with SMTP id d9443c01a7336-2c1e78df934mr243153835ad.8.1781023298472;
        Tue, 09 Jun 2026 09:41:38 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm215177165ad.40.2026.06.09.09.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:41:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Shuvam Pandey <shuvampandey1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Fan Ni <fan.ni@samsung.com>, Shradha Todi <shradha.t@samsung.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>, linux-pci@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <1a0c86ab264cdc1c79c917e984b90991af51d827.1779123847.git.shuvampandey1@gmail.com>
References: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
 <1a0c86ab264cdc1c79c917e984b90991af51d827.1779123847.git.shuvampandey1@gmail.com>
Subject: Re: (subset) [PATCH 2/2] PCI: meson: Add missing remove callback
Message-Id: <178102329225.12739.7391385656856361501.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 22:11:32 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1OCBTYWx0ZWRfX9gUltL8Vlnzt
 xEcEiqgDweYeUZ51P5oaXKLTSgbYNd7Po/8uHhMVXKxxPJCsWHd+ti8HkRO2+i/8a9osWkxK/C0
 RvKXHJ0qde+/AUJa/ducMGwN5OXBytvrfGg346Ur63dfEqi+z3f7D/A6ufoULxYHmaZjLrr643j
 oA0iAyn/IGsl8C1UkhX2qRyXIRUTUHxXjbCVKTPz35yJaJQjpx/I5iBp7N8OEFWq83L8SRJrnKX
 dC8SeVKLhNe/E9bFnRBtEdzIYwokPzhAIl+9Mxu4A2Yx/sIY/s/dmMWhhSbNTXrHmaJEusHzZMm
 aR2vX2seR1iDE+ssXMYCLL4uPnZJLxxw94XMzvTV+lKbQT7jok0KyDO0dv6EW7geLWAujr+F8vD
 fi1ugz4dfG40fBBI7Q5juZxP0gL7d0PmvXCcyexsmRSk0g2rkDqZ9/l1jFPWH0WuyWk0KUgdtiP
 4bL3459qJIN+W6E1tvA==
X-Proofpoint-ORIG-GUID: gkYi_eFQ4HokDxjHC5IagjytIFGCf6Or
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a284243 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Mn0DOdAkTdazpQ9XZsUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: gkYi_eFQ4HokDxjHC5IagjytIFGCf6Or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_094140_593336_41D1D82E 
X-CRM114-Status: UNSURE (   9.80  )
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


On Mon, 18 May 2026 22:44:18 +0545, Shuvam Pandey wrote:
> meson_pcie_probe() powers on the PHY and registers the DesignWare host
> bridge with dw_pcie_host_init(), but the driver has no remove callback.
> On driver unbind or module unload, the driver core therefore proceeds to
> devres cleanup without first unregistering the host bridge or powering off
> the PHY.
> 
> Add a remove callback that deinitializes the DesignWare host bridge and
> powers off the PHY while device-managed resources are still valid.
> 
> [...]

Applied, thanks!

[2/2] PCI: meson: Add missing remove callback
      commit: 4b0dc84b293984f75598881809fb2d3daf54a2a8

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
