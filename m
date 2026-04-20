Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B27F36C20
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 06:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ui9fT/ViOJatEnhvBJndBQIKVFs7hW1Ipykxzz1J1Q=; b=4cTAlFCho4ADvj
	opLn3coahVLJDz4gY/v52kYcp5VcfQYJenKArwZ8Ml1JICxXkoRTl/724BVitKMT2+NG5YOIUC4bg
	ysf9LRiSvqia3OLpUTrjkt7qixN1iFHOY03bU8Z+g4+WIpFdWILA/WUhDlrSWYSoWULQgYeacmE4D
	fsgLDFD8SgFeyVcwd4+TVZF7xZDlPb5ntfqtzEWTyK43bupTzp0NXeE9RBAE7i0OL9MMJUKyT9SlG
	VoYEB7pd3R/48cq+4BGVHr5qigAGEB8dRb60wEQTVS2nYKllCEh31enNAK7joYxnOIlJMIiiI5PYL
	W1J/f1I245d62E1Ibnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhyd-00000006TpS-3FTM;
	Mon, 20 Apr 2026 06:19:23 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhyY-00000006Tni-3Cy7;
	Mon, 20 Apr 2026 06:19:21 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-7-16.uibk.ac.at [172.25.7.16])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63K6Ito81297669
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 20 Apr 2026 08:19:00 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63K6Ito81297669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776665940;
	bh=Ugrejw/BFGpRqCO3FFz5D7BECiapNiJDFJdcWMeJfzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rBodRtbDxa7ddHesEZcPOqXn2tzk8H/5ri5DB0UhAxBAo9p1+3pPt0bCSZgxA5Q+/
	 30epiv5tvBOTJs/PSrRL7uFN2kZpW9wPfvkSEza5ikAgC5FXTBKOijk/N83agXxIAu
	 gzMuPzoueHPnboMlMprHKmSWO5nGek3A/uPQf27Q=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        funderscore@postmarketos.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        christian.koever-draxl@student.uibk.ac.at
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add X98Q compatible
Date: Mon, 20 Apr 2026 08:18:53 +0200
Message-ID: <20260420061854.5421-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
References: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_231919_625326_D72859AC 
X-CRM114-Status: UNSURE (   6.68  )
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

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxjaHJpc3RpYW4ua29ldmVyLWRy
YXhsQHN0dWRlbnQudWliay5hYy5hdD4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4g
S8O2dsOpci1EcmF4bCA8Y2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQ+
Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwg
fCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCmluZGV4IGE4
ODUyNzhiYzRlMi4uODI2NzFkNThkMWRhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbApAQCAtMjU0LDYgKzI1NCwxMyBAQCBwcm9w
ZXJ0aWVzOgogICAgICAgICAgICAgICAtIGtoYWRhcyx2aW0xcwogICAgICAgICAgIC0gY29uc3Q6
IGFtbG9naWMsczkwNXk0CiAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxzNAorICAgICAgCisg
ICAgICAtIGRlc2NyaXB0aW9uOiBCb2FyZHMgd2l0aCB0aGUgQW1sb2dpYyBNZXNvbiBTNCBTOTA1
VzIgU29DCisgICAgICAgIGl0ZW1zOgorICAgICAgICAgIC0gZW51bToKKyAgICAgICAgICAgICAg
LSBhbWVkaWF0ZWNoLHg5OHEKKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLHM5MDV3MgorICAg
ICAgICAgIC0gY29uc3Q6IGFtbG9naWMsczQKIAogICAgICAgLSBkZXNjcmlwdGlvbjogQm9hcmRz
IHdpdGggdGhlIEFtbG9naWMgUzYgUzkwNVg1IFNvQwogICAgICAgICBpdGVtczoKLS0gCjIuNTMu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
