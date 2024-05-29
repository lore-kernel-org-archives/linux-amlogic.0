Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E1FC25B75
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 13:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qpyiBZu8RkMHdBIJJOSJ9x6usCrIZFl8qENG/OVRYGE=; b=evM2oEIfA1jiKE
	3N0RXJA2BsuLIp3elrJRbAsoZ0AU1+ACzYVqIChcDcoOImf5/vHmBm0fCl9P7kPktB1Gxq5Svxoad
	PnljkJmpGWmNSvMvyBx+2ICOQSOpO7nKMDgB8OrWl2J1OtCRR3IAui6ONE/ExArsssAS6+90K6xxM
	CCfdFAuqhJYg1xv7oCg1GyzeQ3zPF+uaUmZHqX0Mp1il1jW4EGGB9C16xx7ee2gzh0XzVrjrkTpmk
	3CZB1UchcQKhTIbL5udz3/hfXHgp5RYVTqyz+oTUyiWK2O0orqJ/bYkXAG7xYCL7coRDsIA/pmnjA
	IWQ8c+plcSuOKf07IsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCJ2H-00000004Coe-1AFn;
	Wed, 29 May 2024 13:08:09 +0000
Received: from mail.bizexpand.pl ([51.195.45.234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCJ2D-00000004Cmu-0wK6
	for linux-amlogic@lists.infradead.org;
	Wed, 29 May 2024 13:08:07 +0000
Received: by mail.bizexpand.pl (Postfix, from userid 1002)
	id 23131A3ABB; Wed, 29 May 2024 14:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizexpand.pl; s=mail;
	t=1716987792; bh=hy7OL951zzMc4+HXkALzt9LRZiawYsmWYUx9WMj5lrk=;
	h=Date:From:To:Subject:From;
	b=U2gM2MvUL0N99jnpYWfgzh1SAjQueAofzFBt7nN7lBvejhaf10z2lU3A2OoDvjV13
	 kErE4N1g0T2dThUlsNhPqcgPfG/vBdDlEgcOqIY+ywdLQ+0Tlv2xs5GnAgBc5KGuOj
	 BZqkoo1ADGFfYvt4pKbM0qUmTT0P/UhZN2WzSAsGnBoMGafA3fBPdEGK/RTcwWM4kk
	 MBsAEWrPd6/ThDGI9nwrun4VR1Mq7K8oXQw/LUYy0lWDej/FpEknNNZnb6NrJ2mUdA
	 nx/1a9jJDMJQJj73MawdKh9U/uKJhr+vFwez8IcO8oU4JZHfA4Rdb6X1s1uULwS805
	 yHv5r7VTsdRNw==
Received: by mail.bizexpand.pl for <linux-amlogic@lists.infradead.org>; Wed, 29 May 2024 12:52:02 GMT
Message-ID: <20240529144500-0.1.hw.23f1i.0.h03l17o9ot@bizexpand.pl>
Date: Wed, 29 May 2024 12:52:02 GMT
From: "Agata Lorenc" <agata.lorenc@bizexpand.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Nowa karta
X-Mailer: mail.bizexpand.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_060805_483498_E22A5BAC 
X-CRM114-Status: UNSURE (   0.55  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IGtvcnp5c3RhbGkgUGHFhHN0d28ga2llZHnFmyB6IHByemVkcMWC
YWNvbmVqIGthcnR5IGx1bmNob3dlaj8KCkN6eSB3aWVkesSFIFBhxYRzdHdvLCDFvGUgYWt0dWFs
bmllIGlzdG5pZWplIG1vxbxsaXdvxZvEhyB6d29sbmllbmlhIHogb3DFgmF0IFpVUyBhxbwgZG8g
NDUwIHrFgiBuYSBrYcW8ZGVnbyBwcmFjb3duaWthPwoKRG9maW5hbnNvd2FuaWUgcG9zacWCa8Oz
dyBqZXN0IGtvcnp5c3RuZSBkbGEgb2J1IHN0cm9uLiBQcmFjb3duaWN5IG1vZ8SFIHRha8SFIGth
cnTEhSB6YXDFgmFjacSHIHphIHBvc2nFgmtpIHcgcmVzdGF1cmFjamFjaCwgeiBkb3N0YXfEhSBv
bmxpbmUsIGNhdGVyaW5nIHB1ZGXFgmtvd3ksIGN6eSBwb2RjemFzIHpha3Vww7N3IHcgbWFya2Vj
aWUuIEplZG5vY3plxZtuaWUga2FydHkgbHVuY2hvd2Ugc8SFIGRvc2tvbmHFgnltIG5hcnrEmWR6
aWVtIG1vdHl3YWN5am55bSBkbGEgemVzcG/FgsOzdyBwcmFjb3duaWN6eWNoLgoKVyB0ZW4gc3Bv
c8OzYiB6YWRiYWrEhSBQYcWEc3R3byBvIHpkcm93aWUgaSBkb2JyZSBzYW1vcG9jenVjaWUgc3dv
amVqIGthZHJ5LCB3ZHJhxbxhasSFYyByb3p3acSFemFuaWUsIGt0w7NyZSBwb3p5dHl3bmllIHdw
xYJ5bmllIG5hIGVmZWt0eXdub8WbxIcgYml6bmVzdS4KCkN6eSBtb2fEmSB6YXByZXplbnRvd2HE
hyBzcG9zw7NiLCB3IGpha2kgbW/FvG5hIHd5a29yenlzdGHEhyB0ZWdvIHR5cHUgYmVuZWZpdCB3
IGZpcm1pZT8KCgpQb3pkcmF3aWFtLApBZ2F0YSBMb3JlbmMKU2VuaW9yIEhSIE1hbmFnZXIKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
