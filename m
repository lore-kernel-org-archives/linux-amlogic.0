Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758ACC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jun 2022 06:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GlS/IL8a6FUwkjOpsNmxVGoJv35nuTrQn5h9EEPMpsw=; b=3gzOoW91p0XVpP
	JNManELAffc6YroZpJE8vzi1Ka8U6z6iodG1VFPfjvVf+kyIR1OVnv0r6qNtxy+OWQeCSI0z5BVjo
	ZYLubwHCfFA6jeo5ajZXK5dALfr+ErhczhtoCV3BrqMybqpNyuyxluuLn2n0iTey7JfGH1VGljyDO
	6tQUE0xw7+glxls3+9UeAdS3QhGHVlsh+yfK/wBBVjWWsp30XZJiQmVrBD90Fa9u3BE4Lhn+LZ+g6
	STwHWPnVvb7yZ3WPE36d4v3Nvj0rOHUbFhGuX6GuGKQ0jI30DSRo+EwDqOg1+AMq61xBRRT1dKvuo
	bD9whhlXSK3TGvRV/Pfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6526-004oc1-NT; Tue, 28 Jun 2022 06:49:10 +0000
Received: from mail.privatemain.com ([45.86.209.156])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6524-004oan-4V
	for linux-amlogic@lists.infradead.org; Tue, 28 Jun 2022 06:49:09 +0000
Received: by mail.privatemain.com (Postfix, from userid 1001)
	id 8A8AE8297E; Tue, 28 Jun 2022 02:46:40 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=privatemain.com;
	s=mail; t=1656398947;
	bh=ydItAdwWOyX5wABuTqD9n+VESLmlWw/YxTJchbbqnDQ=;
	h=Date:From:To:Subject:From;
	b=ky2hCsEQU7bIbQhjDx7YOp5UGTrwZTkMuHkKCdTJateUTw+Chf7Fdp6ACBtcZp7jr
	 cdWPPHj2NylM/UchRm1TzL0dhC/6+4jEQNo2kThcRHaGxQqNri+NVzebkH2XNlKT9c
	 bvsEK0Mj5fcGlBhYBWhFBYL3p1Ek4ybCPHCs43BoX23IvSfNxbJzisb1HAT8cpOFTp
	 uynOmEUfK9Nz9spqL9QARDearAZ6uBPKZmPVnHESUF3Xk5hc/40WNvMqwpqYxgX6N6
	 jGaON6Olk7SQI7w6auB/AKKLwQRn4LwoejXlIkMV1eHj31jHZKJzegitTCGNcCSjo2
	 /s55o3m1E+8tA==
Received: by mail.privatemain.com for <linux-amlogic@lists.infradead.org>; Tue, 28 Jun 2022 06:46:31 GMT
Message-ID: <20220628024500-0.1.26.1g1r.0.2vavaw0q64@privatemain.com>
Date: Tue, 28 Jun 2022 06:46:31 GMT
From: "Maciej Kielar" <maciej.kielar@privatemain.com>
To: <linux-amlogic@lists.infradead.org>
Subject: Prawne zabezpieczenie firmy
X-Mailer: mail.privatemain.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_234908_240373_9A8CFB19 
X-CRM114-Status: UNSURE (   1.30  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIHJvem1vd2UgbyB3c3DD
s8WCcHJhY3kgeiBuYXN6YSBLYW5jZWxhcmnEhT8KCk9ic8WCdWd1amVteSBmaXJteSB6IHdvamV3
w7NkenR3YSBwb21vcnNraWVnbyB3IHpha3Jlc2llIGtvbXBsZWtzb3dlZ28gd3NwYXJjaWEgcHJh
d25lZ28gdyByb3pzemVyem9ueW0gemFrcmVzaWUuIAoKRHppxJlraSB3aWVsb2xldG5pZWogcHJh
a3R5Y2UgaSB3c3DDs8WCcHJhY3kgeiBkemlhxYJhbG5vxZtjaWFtaSBQYcWEc3R3YSBmb3JtYXR1
IGplc3RlbSB3IHN0YW5pZSB3eXByYWNvd2HEhyBrb3J6eXN0bmUgcm96d2nEhXphbmlhIHBvZCB3
emdsxJlkZW0gcG9kYXRrb3d5bSBpIG9yZ2FuaXphY3lqbnltLgoKTW/FvGVteSBzacSZIHNwb3Rr
YcSHIGLEhWTFuiBwb3Jvem1hd2lhxIcgdGVsZWZvbmljem5pZT8KClBvemRyYXdpYW0sCk1lYy4g
TWFjaWVqIEtpZWxhcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
