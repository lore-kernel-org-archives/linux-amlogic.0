Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842BCCD8C90
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2026 21:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5rIbEwzB3mmsm58rmtk3epHVO+GHSLMd5r8xNCYY4M=; b=sz53+tDozc0xYv
	xR1PzfPY+db+NQdV4k53fbhvgabhxpaKblgZRHQygcRTSXIbGGbO6EKAqE/opla+EfegMsOLhS1dH
	bRQnij1X2x/cd6DkPDmekIS0Z+z+0L4JM0RWEIDjQq8bpVAUd8/4kJNbz91n43G/txh3OLrCHnVDP
	FUK7f4ZIy54nIQcsWIPMa4/ILPJHj1uhW7bvB72s5DtKbhqtduSE+PmFLLDU67UZDtBQsMpRIgwm+
	QX2Cgy9QR++Z6l5ckdp/M4DaQvpvPhIHW6JT3+DZMR6YwHCIYIZXYHFk6hH7sulKT6RwZWn+6vdFV
	FLYHh5E31fwc85uD0E/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLSc-00000002Xgc-2oFR;
	Sun, 07 Jun 2026 21:55:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLSa-00000002Xfl-0lMo
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Jun 2026 21:55:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El1N9866187
	for <linux-amlogic@lists.infradead.org>; Sun, 7 Jun 2026 21:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4OGc3jEMT7ZP6mQqSI1cOL/G
	1ZjfZWPKtiL7dzICldU=; b=FNKCdJuZBdytcKuzX8grLCyzWIYxtAWCidcdFGbC
	L8hz+seOzQ0MS8T5hmeD4m9Cw9/aWpQIchkgWGjC83SO4TftIb4dGrlNy9uYBqD2
	B8lrcpF05qpcC2Bmn3BCmFf24XpVBgwJkJ6F5oXEdEAcPz6oEeMoNlX6M4MvE/Ex
	iVPVioUzahkDWMIsGz7aC2i3XfvlJ/EKU41qXNB+EY9y+JCQ4jQmqHaioeMLx8V7
	7gNGUcLDqNZm1GrIeII4pwaJoHz7gyitqxAvUSZVmBIuEZCUrmjzen4BWulMUxPA
	VTLjU4+GLCj4JYPVIZxq0A8DvTGj4j7vSt0hb9CoSc8O7A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4x9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 21:55:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5af6d1a2c32so750653e0c.0
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 14:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780869310; x=1781474110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OGc3jEMT7ZP6mQqSI1cOL/G1ZjfZWPKtiL7dzICldU=;
        b=UbNBjQLbvt2oL8yOu/Cilj+029Jg5DIA1TgNdPEmtuu7awBtgf85M1HgWw3K0jmfVE
         SVL+CrN/a0Ck2D1p05ffdVhxhnkoW9gmTguZjT5owSDOvQGUJmWC49drMqqBNk0oZvwT
         0PNfuD5zL8ammKnIN/nSQtcUi2BxlzsjypN/EdHGKRj4MNJIsXObihb4IVwcawaAheMV
         s41w7Ww3B4naMEY0djj8KmrtLctZ4rO8tLKb2jNx8V+v4NhUU46R+WA0M5l4GYf9Rng3
         Dfh1v6lm2TxZe2QuEBEScg2mgfAwXmpDoo/KS1h1Iq6XAPIJUx2jplKyBtjPV3XcaIay
         ZQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780869310; x=1781474110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OGc3jEMT7ZP6mQqSI1cOL/G1ZjfZWPKtiL7dzICldU=;
        b=SBKAtoipA62NH8eSfBC51ZcdhWULISt4nkbcKLmSDCif64gstpMv822ZJhI5mFGVg0
         qE8wv4z9MB4jv87hg3tbZfIzDtmb9yCEaM4cpkfGAbH49rZ84UCFViEfYM4tfOsGYUnp
         GBw6mNvl9lOfw5KaxldeNuTm1c+/yBvy4afVprKy2+k5HbInJr9crhn0SwX9Hhu0TGO4
         Yiv8J7+HG6Fua43lxQhEhfRDPkTxzYFVvWtS9dQbp4bbrhTuaW29HG5Fih8YfdAIusEH
         qvLH/gDRbCco7nw4HNpJG+uNWbZOjk6a0fX/ADUAGRi20u3zGK0L1PslS1g6lJ2VZ5gF
         hc+Q==
X-Gm-Message-State: AOJu0Yz0G/BqRbtH5QXVVyXH/2se882yPTQeCWG0IOkTg2/WqwRriu9M
	j8+O+pSZWgtI8wgFMzJ+xzlGcf3cE0fgFi6yoaPVpG+26OYaX7oq49Qs8EvtHrUxMSvrOoT1yUw
	jBmJgdt1TOM0QQ3aMbzvtdGXUBCrYOmA8/mBjAsHBjaITFFCG/L2K4028BhGh900RUwmjLnzgCg
	==
X-Gm-Gg: Acq92OG1eEQ7SVYkD2HTXy+nWwEKHBOBjxaXECeBO0cfsX3xZvgXb0tnOacIupjf+19
	yQUZHgLBLgs+0CJDup+iA0Z1Qcd2el1cbclHDYmBCjR1RGGCdJsPOv5EtDVT3fUlYTqwI5NsWtU
	ti32LOr8wldcZ0NtBqPTNubfW7eW8iSlcZEPbENbNCO9p+UNsAcS/4M4rlk4ABG5yn1bfHGSKP7
	pTD75nRein20R+Ju6yW3C34jKx4Ibt9B+oNulOUdsJ6b8Tp/SEi71pvxNJiMJVpftIoRxq6O9PQ
	x367lltLwzrWfgQyWqNRNLudKDUmJ4LG9gVwCFRsoZlfcgNfPnLdC5TUTTg0zcfNc4VKl5F5w61
	jWxFS5pNrfk9etv3a7VeP+qe8Vx914K4fJe8rfzzNKBv5GodVomwUmoLb8XTdfuKnTsKJX92Rs/
	Hq1cIQlxLNdDvnjkaFRZEDKgckrR3G827XvN9mcNaCOWdzrw==
X-Received: by 2002:a05:6123:a1:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5ac548400b7mr6178619e0c.6.1780869310368;
        Sun, 07 Jun 2026 14:55:10 -0700 (PDT)
X-Received: by 2002:a05:6123:a1:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5ac548400b7mr6178612e0c.6.1780869309948;
        Sun, 07 Jun 2026 14:55:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9868afsm3368954e87.59.2026.06.07.14.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:55:08 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:55:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 8/8] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
Message-ID: <qvxtodvp6zqeohrb36kjxrglkk4rx3gohrx7uvz2x7zm5fxlyp@t7d25j2pm6le>
References: <20260608-hpd-irq-events-v4-8-30b62b335487@oss.qualcomm.com>
 <20260607214621.9586A1F00893@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260607214621.9586A1F00893@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: bCFutvqsoNx1nRsp1Wv9ki4nk0OqF5OB
X-Proofpoint-GUID: bCFutvqsoNx1nRsp1Wv9ki4nk0OqF5OB
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25e8bf cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=aFa75qVXnfFcn4bRmZYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIyMCBTYWx0ZWRfX+Y2HHbhYm/dn
 5cba6eDuH1kro1JvoTNkpctRDqJuzzwvwbTjmxx8xBmRjdAOmA7bIHVXT3wTkAsDMVfTS5u/Eg7
 agllM1pRgWSDMEiT7Jc5YG0wn1E6iCHAAlNWosPEG6xJEad1a4qBYcEM+pmyEXiRw2oYrd7/71f
 K0F14pAIEZ848WCL7whchFWmV7eyJAkjR8mKzzlCwLiUKBzkjeLIWxoIzKrht6JzIeWj0+dSBL4
 D/bmNMjtg4BmfyMbLvnAiDs6mN8nb9OrMCyUekOLmE/36DnbDlGh3KbWNEkbmH2C0S+3Gxvi8Bx
 Z1xfirh3rlxKwBc/RpqvggcGt1JFaCZUwDoILqiAyyDNlnYDPkjFwsTEUMoRoG/3pbYil5BFLPF
 X8qp8a4bShW3dlQ0abaSxu+USlbez2mVUh8qPSye1XyqN4aQbDv6puqQvj+NnRqPyQ4kx8Tn4tE
 tw3HmNhVwpsq/8oOMwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_145512_346073_659498B1 
X-CRM114-Status: GOOD (  12.23  )
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

On Sun, Jun 07, 2026 at 09:46:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Early return misses EC hardware acknowledgement, potentially causing an interrupt storm.
> - [High] Deadlock between EC threaded IRQ handler and UCSI notifier causing inevitable timeout.
> - [High] Out-of-bounds array access due to dynamic `num_ports` update surpassing allocated size.
> - [Medium] Undefined Behavior due to shift operation with negative exponent.
> --

Pengyu Luo, is this something that is worth fixing? I don't have the hw,
so I can't check...

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
