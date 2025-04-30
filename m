Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558D5C369D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Apr 2025 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WKti6yIhLoydqcqN34q17uN19uCdS5EzjwhCCDAvrTw=; b=FAcG0rm//aaMmK
	7HFwOm+ic+nkjmOW0kvjOVmR8Wp2oHaTUv6lfKjzcTiPSDWnrpXswcR6ApAWlwFlyl2yJVYfbI+l4
	yppHC85EBCmEDhKxfZnaDV0yxfvKp/cEUkLgAZs9KKQyuMFYJxeVJr2WB9mftst4mK61+7LOzMQJs
	NNJxcyxR3mrWkJ+reJ2h8V/c2ea3rPPRpJsatWmkJ0qGZ6WqFFQf+G5b5PcyKZ0oebiGcbIXrJCRU
	EG+GhwJpR9fCyd6CVgR+s4sZ0ZkUSuav05vx+yWi5khTuTmzrhbO1FvMh63cnhlE9nnK1ry6VsQyG
	dA6ZVpxkp951vMJJGggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2b0-0000000C75z-42Kz;
	Wed, 30 Apr 2025 08:15:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2Eh-0000000C3EA-3s7C
	for linux-amlogic@bombadil.infradead.org;
	Wed, 30 Apr 2025 07:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7ZTtWeR14KGmyVZVpV9br+vqxTirh+yviRsdhzwGi7g=; b=MK3rIW+OhxvXobdaHnfkquZm0a
	8DRopQesHPqg22qdK2yQIcs1RI7/2wl8QvUISSHTOX01z4MQdBduVE0ggTMo5ljvLm+bEbqbUDALF
	DZySZbSpHg/5ZiMEMYI/tkIgwq3KX8976DOnZ+Kx5RVDwV0caqBtl7gmNeqir3jFbwYZsWE62PSnP
	p1qxgGvqDN5eiH4rj+hi9C2gbPJqidv+4ewXnmNBiTTOupzUx3lvyxBi7odt7/ml5PDwDG1CwHpRK
	89dIg3KvwMa122WrVB7rjDC9Z19sDFCAtlAaJRZve6hgLhIVrKbkSuS9ZRQx+Gl2MVIrz/7uAhJ7P
	SGZrWY2w==;
Received: from mail.sparklesage.pl ([141.94.21.160])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA2Ee-0000000Dj3Z-1OAr
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Apr 2025 07:52:06 +0000
Received: by mail.sparklesage.pl (Postfix, from userid 1002)
	id C73004A713; Wed, 30 Apr 2025 09:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sparklesage.pl;
	s=mail; t=1745999510;
	bh=7ZTtWeR14KGmyVZVpV9br+vqxTirh+yviRsdhzwGi7g=;
	h=Date:From:To:Subject:From;
	b=O68urVAi1oH330NpuXAk+gMWhQuO01qg+H43e+s7EwdrheDGeSktaAVmNSXk+/VTJ
	 nvo1t8sb/jlrjQ8W5hREX2B87x7TLee0kDPjDHtEeXhU43PQRdiscP4BcF8AH2lQS9
	 +pytHhNeSMCwXNK+GHFbS8/M/N4oX1fUfU3LxAhckZo4uPxpmrLulglyAwXx97a7kP
	 8GCqwHoEQFq1YX2TCtxV5AY4dlCKW8Vq/MQ89hjj1iDQEUHCa3zqGXQgyLIwdOgGVS
	 4ozwXYLey80lXo9uoHGJWGHPACnJzhBmcCALR7XP716oSCWzP9P45xCO2Qn2XzZ9IA
	 wSubGwEtWij4w==
Received: by mail.sparklesage.pl for <linux-amlogic@lists.infradead.org>; Wed, 30 Apr 2025 07:50:33 GMT
Message-ID: <20250430084500-0.1.dp.1lvbg.0.p7iq59o9ls@sparklesage.pl>
Date: Wed, 30 Apr 2025 07:50:33 GMT
From: =?UTF-8?Q?"Katarzyna_Chowa=C5=84ska"?= <katarzyna.chowanska@sparklesage.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Redukcja_nale=C5=BCno=C5=9Bci?=
X-Mailer: mail.sparklesage.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_085204_925699_307F774F 
X-CRM114-Status: UNSURE (   0.34  )
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

RHppZcWEIGRvYnJ5LAoKamFrbyBmaXJtYSBzcGVjamFsaXp1asSFY2Egc2nEmSB6IHpha3Jlc3Ug
cmVzdHJ1a3R1cnl6YWNqaSBpIHVwYWTFgm/Fm2NpIGtvbnN1bWVuY2tpZWogcG9tYWdhbXkgcHJ6
ZWRzacSZYmlvcmNvbSB3IG9kZMWCdcW8YW5pdSBpIHByenl3csOzY2VuaXUgcMWCeW5ub8WbY2kg
ZmluYW5zb3dlai4KCk5hc3phIGthbmNlbGFyaWEgb2ZlcnVqZSBwcm9mZXNqb25hbG5lIHdzcGFy
Y2llIHcgcHJvY2VzaWUgdXBhZMWCb8WbY2kgZ29zcG9kYXJjemVqLCBrdMOzcmEgZGFqZSBtb8W8
bGl3b8WbxIcgY2HFgmtvd2l0ZWdvIGx1YiBjesSZxZtjaW93ZWdvIHVtb3J6ZW5pYSB6b2Jvd2nE
hXphxYQsIGNvIHBvendvbGkgUGHFhHN0d3Ugcm96cG9jesSFxIcgZHppYcWCYWxub8WbxIcgYml6
bmVzb3fEhSBiZXogZG90eWNoY3phc293ZWdvIG9iY2nEhcW8ZW5pYSBmaW5hbnNvd2Vnby4KCk5h
c3p5bSBjZWxlbSBqZXN0IG5pZSB0eWxrbyByb3p3acSFemFuaWUgcHJvYmxlbXUgemFkxYJ1xbxl
bmlhLCBhbGUgcsOzd25pZcW8IG1lcnl0b3J5Y3puZSB3c3BhcmNpZSB3IHByb2Nlc2llIG9kYnVk
b3d5IFBhxYRzdHdhIHBvenljamkgYml6bmVzb3dlai4KCkplxZtsaSBjaGNpZWxpYnkgUGHFhHN0
d28gcHJ6ZWFuYWxpem93YcSHIHN3b2rEhSBzeXR1YWNqxJkgeiBla3NwZXJ0ZW0sIHByb3N6xJkg
byB3aWFkb21vxZvEhy4KCgpQb3pkcmF3aWFtCkthdGFyenluYSBDaG93YcWEc2thCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
