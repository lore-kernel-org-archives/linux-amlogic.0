Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9A3C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Dec 2021 09:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8tj8Q4Y1qMVo+12VaAsYV88COXzih9FklMo6yS99Ec=; b=i8T5tEJ6ZpgYim
	KqpkEoQKjY14nXWfs+rnMJiv3EfyejXJkb8t71reh+BL609/87Pfyhj/HWs+t+dpzkl9MMYcsh/7T
	mhM3/dIDOHfHK0QhxfzYNiGYqsWaTlxDkEwQJ2LWb65wdSK/oug4svKmJwiJsTpJjUFG6UIkKicWp
	hrfknCqswltKJ9zPWqvltlPQ5bkh8DmyRc33oHNUdnAsiudW4UQUDmPudatIqoEZ+hs6n7ffXN66u
	vAavszDycDfa0JQ59zDPiYxG5gsZ0+X/n4Sd3yqufHXsGBGy+ElBvRKGunTKEhrlv7ecJNdduLywy
	bgmEKW+nnusHNoFjnXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1Pqm-00FPYE-Ql; Sun, 26 Dec 2021 09:29:56 +0000
Received: from slot0.jllresort.com ([62.197.136.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1PqX-00FPU5-Kw
 for linux-amlogic@lists.infradead.org; Sun, 26 Dec 2021 09:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=jllresort.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=ele.mon@jllresort.com; bh=OZJ2+kwY7dVR2p5SWzNFVmyIaYc=;
 b=GksjFSiesgLM3ysiaF1bx/a9Go2700y5LjDc9WYF1tIKV2D0Y+SADTuRYcbd55aPvqeeE21hY3E8
 0dEQN8/tIr6FlIdlZPLjCBAzpn7oh/m6t+gYNntAnNhu7ACXIn+gZ36Hb599xgb1LGCwFlxN8fCU
 52GkRXo+mZxpw0k912BWr+joE5wRu/POfZ0tEvD5McXPIR4DUiQrXFLHjq0HpGHoWPnvoM7yHsau
 6EHDq9E0hSmo8keUoD6njTd3MjTTGLDRHSvsC3yY9sMZrV/wbBuCuOZi/h8I6+jx/uIOjEhz3Zv9
 WsR4hyWWeEWKt7mR2R3u9LrnXQlJAiz1waofsg==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=jllresort.com;
 b=PKDPK2owkDXPQkX9WTHqc06u1hX1a+VQKnhBQqkbyHIZMaoSWq3r6qFvKH6UAbQlcymSxKxyMsJY
 Nph8iYrqDaWSkzggCQtLcLlpYg7REKkJfN82rAPGWB6+3hhG2EHUz9qo37BaK0uq0SIgIdXpPKuK
 TFin66/gostK+/SIirvBDko3+d6/60sBD4quODBT/PEd42RU+ALFYjDmtmgzLozmzCp0JQAc8gSy
 KRIwYLBdGJhY0v1nrXCfWgzUtO1eefMffwKZ3D5E1RBmJ67x0L0sCtUqIML/KK6bDB3EONjj2f0A
 2s+AenAxl2zmo7qTFAWHbhg7QbSA50V/hgJD3w==;
From: ele.mon@jllresort.com
To: linux-amlogic@lists.infradead.org
Subject: Happy Weekend:
Date: 26 Dec 2021 10:29:25 +0100
Message-ID: <20211226102855.B90A0736C36AC79D@jllresort.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_012941_880229_2A965ADB 
X-CRM114-Status: UNSURE (  -1.30  )
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
Reply-To: mustafa.ayvaz@ayvazburosu.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Greetings to you linux-amlogic,

I was wondering if you got my previous email? I have been trying 
to reach you by email linux-amlogic@lists.infradead.org, kindly 
get back to me swiftly, it is very important and urgent.

Thanks
Mustafa Ayvaz
Email: mustafa.ayvaz@ayvazburosu.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
