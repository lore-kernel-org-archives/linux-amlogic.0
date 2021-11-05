Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FD0C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Nov 2021 10:04:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9993B6124F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Nov 2021 10:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9993B6124F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=WfW03M6oObyhl2v4DcTyOW4Ohamw1vqwSiN0LRrYqfk=; b=Hk6
	nzpYT+j0JuijTmCrRze9HFXoE9sw+lLrQGycoy3IpSr6y2gmmqIOGMrtG04ed/+7MEklTy35M+WJO
	QvHwt1qtUjUcX1DkfxskKE7ZqWcvyemDO55Fv32d73w158dEOlC6ob/W604Jw/SJEKYu97nZyuw1K
	H6rW/Lr/T/kkvM26NNuH1n+HY0f/gxQsjhp/gLFaqkuDqrWUXzoq4g8qlkFs+4hQ0/R2nXcl/s4Vo
	9r789TIKCTWC1jz+acHnTnSpTYxYXdphEo1Va3NCHYo+k8WOQsSudhn60EGZOX2ZovdAXQy4uy5LE
	DzKL4GTlYuZ5I09V2OUZ6u7zEG2zusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miw4i-00B3Kk-FH; Fri, 05 Nov 2021 10:03:56 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miw4f-00B3Jo-Pu
 for linux-amlogic@lists.infradead.org; Fri, 05 Nov 2021 10:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636106625;
 bh=riI2G6xOXHtjraHO38K1N8KULIpof6o82hNnYywWMtg=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=ZJxOGthBy4nLK00Wuq6AsO/OtjassxaEXlMFoi/GfH+/bNMgB0qbz6NskBCJL91x2
 Z4an8XASoSTDzavmhB8xzHwwm64rCuEaBGevCS3xSmMQT0XFp6G6GdTuDMUx+Wx9Ch
 gxSd0d+e8LZxQOnYa4JDUY4Gb//pt8ow7YbXURaY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [81.200.197.163] ([81.200.197.163]) by web-mail.gmx.net
 (3c-app-gmx-bs31.server.lan [172.19.170.83]) (via HTTP); Fri, 5 Nov 2021
 11:03:45 +0100
MIME-Version: 1.0
Message-ID: <trinity-fe365669-0873-497a-b48d-35ad82cfac51-1636106624891@3c-app-gmx-bs31>
From: =?UTF-8?Q?Joachim_K=C3=B6nig?= <joachim.koenig@gmx.net>
To: linux-amlogic@lists.infradead.org
Subject: Using a PIP video Window
Date: Fri, 5 Nov 2021 11:03:45 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:DAisi/CWps0KINj33vbT0ct48xz/3JXc6908uDwOrBE7f43l4LbLU9LXktH0O4KgvuTHJ
 kEw/yDEmfuZmPotUzcMScueX1MQ02UGoiZCWQcKz0vjP++DZqwldVNTTrpdAvFBQkaOEv3at6uzF
 8rTIQ3j7piJCkY6imF2je5dNzMOW0HJT7M3YFh9TcC1UcCyK8p+zPKJDVTTj5GK+q5XiGsRFBH3A
 mbAw9LMGWNpi9yEKaCoi4wmkqDDoqmgYF40OrBhjcRcVbpo4uSwvhupQ1GxXkzLCDGuwAXUbyzTf
 yQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:VbEq0v2Zya8=:o7AAX7sxXQXzY2eDRnG5ah
 LYapMIQgAAA41VX0heJWmHIR6BUf/PCIbwBWBakLxOyOLRe4hMAiu8GdDsRPaIx/v4SSxwaoU
 VeK0/gRbJMzo5JJPNL2Sfe7ALhhW3Ty9oX7dpeFfVICGTcbtDjuUCcYAqLVlwNTiehueaeapR
 jXdF/ndOAe7n2i6oTJZtT1m5Vk8prpBzSpbydINHaiTw5hpOX0qNwFtZCLbKts+p7/iF6Cyux
 /QrA3TLS7dTcg0u78MwNQ/X6aPOXAAqzP7fi7rtFO+v2vhr2p3Oz2YrAxq90OUV725e66Kd2p
 bOOZkXiOn0iZXSZJ5SXgXqhou9Pi4Q3KI0T7yWiLmwo/dQNxt1m9zZSAtviMUspusUnWZBn+d
 Lf4gx32BHBzjB1Qb2vY31/qEcCTRrRDipVm86Rst+4GUt2vIEujsRawSVqTdrOhqIXuzYRumB
 3nsE47iaV4bQIn6UTyFbbu9iaJVXn4P4De5AClQZsqgPe2+FefJvbskG4P4fmoQx9XKm23R/D
 om9U2c+2sKljVWYYcsr/8MJesCEe2MnGXnKAGN8mizRDwzwv8zT4Lg8BDIZNNIfUB9TAjQCIZ
 ZieSV+M1hfDKiXEwHdtjagrOFZCkfRBO9t2QnS+xbHQ2BWH+2Dw1107/6rGxCOKVtL9lik2x7
 8cCyplj7uYsfpTlPdUi32O+JmMx+qUCFfA4wTKu79b8NDm9vLjpZpFoYSq7hKVBbqntM7QD0k
 /04SIdnhwmAEiiw5msAbAdZBMCn4XxVAl+m8eMxgeqV2VNP1Vvr+ZrucqO/G9bBNt7YkH2yVP
 Ozz/CXy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_030354_220599_94B034E4 
X-CRM114-Status: UNSURE (   7.62  )
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

I wrote a video application to show tv on odroid-n2. Now I want to open a PIP window for a 2nd video stream.
As I can find no docu on howto to that I ask it here.

Currently I open /dev/amstream_vbuf
Set the format
Init the Port
send Es Video Data and get a video Picture on screen

Now do I need to do to enable a PIP Window and send e 2nd stream ?  I have seen dat several PIP functions are available in the kernel, but what device do I need to open and how to config it.

Thanks for any help
Jojo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
