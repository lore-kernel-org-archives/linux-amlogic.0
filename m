Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF19EF9B605
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2026 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5w3+GvNOff21Gl333C3P0EaKn0Ah/Z8K4y7cCLrUYc=; b=b58wQUuGqOAllo
	2xwdJybWy37TnU2OArbGtSBZ41hUIJ54brqqniW8j4UIoeWb5djquddxmbw1EqM/zZHX4DXszR+pH
	wqwNwove0+hLpR1K/5NP4sw8GK8G46j0m7nuJOsxun7g9TBWk+d+dDDsjcuFKrF39Rc7NQwA5EtFe
	onYw/sMXk6KuePNFi6btrDAxjP7Fe8Jp4kgTAVqU7+9v9ymmyAgxhkU1nswGAqxho8nkT/UHqTC1G
	kmzU1CXj4p4QfmPy5mFQuD0ORSVv4u0azNBUnavUk9f0yE6e4NjDpFZ8upFG8LYekQ2q65cmcsdSY
	T5Qc243Wyw7RJbUpKs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUN7-00000009uCm-2GWn;
	Wed, 22 Apr 2026 09:59:53 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUN4-00000009uB6-1izv;
	Wed, 22 Apr 2026 09:59:52 +0000
Received: from surface-pro-5 (77.119.189.253.wireless.dyn.drei.com [77.119.189.253])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63M9xVO43161132
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 11:59:39 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63M9xVO43161132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776851980;
	bh=kNeBbIqYIqxlRsKdVhiR6F22VabQkzDog8hf9Yzq+G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IpSd64SBVkcOAdrNcX2umDMV722PvBB5QXCdtQgFTNOZlBmFWHMfQbOmzluXTqhcW
	 ycXcjdw8NgcBjDfGil7+s4ZrllQ+1bpfHrHLKcfEI9Uf6Lf6/csKXCt/OjyZ3Am4+0
	 sPSVk8Kd+mD+AB86WY6clnZmf4z0frCuVPiTJ0DI=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: amlogic: add support for Amediatech X98Q
Date: Wed, 22 Apr 2026 11:58:39 +0200
Message-ID: <20260422095840.26139-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at>
References: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_025951_056539_4CF15BC8 
X-CRM114-Status: UNSURE (   7.06  )
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
YXhsQHN0dWRlbnQudWliay5hYy5hdD4KCkFkZCB0aGUgYm9hcmQgYmluZGluZyBmb3IgdGhlIEFt
ZWRpYXRlY2ggWDk4USBUViBib3guCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvD
tnbDqXItRHJheGwgPGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0PgpB
Y2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KLS0tCiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8IDcgKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKaW5kZXggYTg4NTI3OGJj
NGUyLi5jMDE2N2ZiYzMxMGEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCkBAIC0yNDgsNiArMjQ4LDEzIEBAIHByb3BlcnRpZXM6
CiAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxzODA1eDIKICAgICAgICAgICAtIGNvbnN0OiBh
bWxvZ2ljLHM0CiAKKyAgICAgIC0gZGVzY3JpcHRpb246IEJvYXJkcyB3aXRoIHRoZSBBbWxvZ2lj
IE1lc29uIFM0IFM5MDVXMiBTb0MKKyAgICAgICAgaXRlbXM6CisgICAgICAgICAgLSBlbnVtOgor
ICAgICAgICAgICAgICAtIGFtZWRpYXRlY2gseDk4cQorICAgICAgICAgIC0gY29uc3Q6IGFtbG9n
aWMsczkwNXcyCisgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxzNAorCiAgICAgICAtIGRlc2Ny
aXB0aW9uOiBCb2FyZHMgd2l0aCB0aGUgQW1sb2dpYyBNZXNvbiBTNCBTOTA1WTQgU29DCiAgICAg
ICAgIGl0ZW1zOgogICAgICAgICAgIC0gZW51bToKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
