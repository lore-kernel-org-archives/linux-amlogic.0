Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A5CC982D0
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I55a3BHpyRVJjinYGmJk0TLsMplFbggXX8ndq8kC8/g=; b=c8SfyqQWtucczV
	jX7asPuAdpIRxCuLfOlMWfqZiFI8+JJEy7ZfeiYIXLyp64xdk8Bj4JjUnVRSOpDux8oMO4N/ovEMt
	90zhS7fQGE/EsTBaozJ0gJMTFDE9YW2rwRtZMoWbAv1pdbieQg6Hbsuk6Wkl74+Cqipi5TNZu/FND
	psnZYwZLwX0TkclLEBuLOD5gtX1s7IZI/19Y0X0vA3eym0Lf0lorLfYuUPj2CvAc928E/b9mxAnLa
	DdNnQuUvy9fWRUqrxv3CteEM8wXYrDprBVtcko+wMsFMo6gpmXobyxSeKmiZ2zjk9gvzleUoWvCmw
	XIzMIuATTVl5kfWbCqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x779d-0000000AqpL-1fAo;
	Thu, 17 Sep 2026 08:07:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x779c-0000000AqpF-1ZOy
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 08:07:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 249B941A8C;
	Thu, 17 Sep 2026 08:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971BF1F000FF;
	Thu, 17 Sep 2026 08:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632456;
	bh=RbbGft3V8Igjyap2JJgMjhfd1vsG/7Rr8CPDW2yMTlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FXmOz+MOXp/utC8cN0kFwUYafNgg7gVgjvc6WeDYIUpG2CmqCsAxTwALWKa2Mh9i5
	 RQuZEFmw1sJloFN+m/ICzWNUs+jRB46SxkCCxYmZiULuWMSfQIqmpJMrFISIo3Ku6A
	 7o+6KWC4wltV+iWrdS4VE1AZrcII8pjLi/JMkljD7SE8h1/pVux1fK3k7/Cdm86mXx
	 Ze7aWQoGJVUVx2S+pBkxRCZ0r1XLdoZvr7SpNIdRO1EOJncu05NzOj+UJjZ7oq8BKR
	 RUkfoYwpbYezYssh/0x7wuErEn9nu8MKeKp3Wcyzgat7k8DzNmLEmuh6T4FLIusTBo
	 v1mQbJQXDdhxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: lee@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-2-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-2-497cd543a148@aliel.fr>
Date: Thu, 17 Sep 2026 08:07:35 +0000
Message-Id: <20260917080735.971BF1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBD
b252ZXJ0IGtoYWRhc19tY3VfZmFuX2NlbGxzW10gYW5kIGtoYWRhc19tY3VfY2VsbHNbXSB0byB1
c2UgdGhlCj4gTUZEX0NFTExfTkFNRSgpIGhlbHBlciBtYWNybyBpbnN0ZWFkIG9mIG9wZW4tY29k
aW5nIHRoZSBzdHJ1Y3QKPiBtZmRfY2VsbCBpbml0aWFsaXNlcnMuIFdoaWxlIGF0IGl0LCBtYWtl
IGJvdGggYXJyYXlzIGNvbnN0IHNpbmNlCj4gdGhleSBhcmUgbmV2ZXIgbW9kaWZpZWQgYWZ0ZXIg
aW5pdGlhbGlzYXRpb24uCj4gCj4gVGhpcyBpcyBhIHB1cmUgY2xlYW51cCB3aXRoIG5vIGZ1bmN0
aW9uYWwgY2hhbmdlLCBkb25lIGluCj4gcHJlcGFyYXRpb24gZm9yIGEgc3Vic2VxdWVudCBwYXRj
aCB3aGljaCB3aWxsIG5lZWQgdG8gYXR0YWNoCj4gcGxhdGZvcm1fZGF0YSB0byB0aGUgZmFuIGNl
bGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZA
YWxpZWwuZnI+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBp
c3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNy1hZGQtbWN1LWZhbi1raGFkYXMtdmltNC12
MTItMC00OTdjZDU0M2ExNDhAYWxpZWwuZnI/cGFydD0yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
