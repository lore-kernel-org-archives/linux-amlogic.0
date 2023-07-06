Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D893FEB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cn8d+4B0uzo/DaYduHchz/mHA3BTLiPdLfsoVZIOPSA=; b=4lfpXLtLvZEp5+
	6T4mRq630GU+tIeSjgNfyEIvATWPurjnY6zx7tOuaP3Dkr+rhMQdpZkdy8jNlT74n/WzQrfJC87ZZ
	NKGNcLnTsmqfHs7mBHxaFkQoRP1gHqE47Ufq1b8SRX51te6gYmxzn6nCjsuP7QaudkoeAWS+07JmY
	8r7cywkfAn4rwiDc6i7BfaC8D7HrZnNx1KyfBlxXCd3y3QAzkRqr8NVMZlXeA4B1ZucR8ePYhUczT
	xvaS02nzZLk1bQTbu2/dRcvqjd8tZ5uk2Ij2qBHVARgj930GaBFEJHYk+Uumx4/obrJAhtR4+Qsjy
	A0I6E1r17LJAoAxzODdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJuj-000sTi-2F;
	Thu, 06 Jul 2023 08:00:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJud-000sOd-1s
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 08:00:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbd33a573cso3771155e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688630424; x=1691222424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93L8BkPgEfdpngtMZOT+90bXoBGPqeAdqsv/Z4sCp6I=;
        b=vU150XI9RDT22VBPIwT5mYMka69+Kv9fzSDZpO62LhYUTzg6WLSHtDoGe/gcfFQGR/
         UhrYqb5fDziNFbOSypz2z78fKWyyjVV6hV20yMOVXczDmP1878TWgV9xq7atIZzXrteB
         BOrjtLs/APd41gYW0q6Odz0YgZW4anlVDfY9rzq+hJu38UNCoeEahZQispC4MwreCLe1
         rrn7KQT8G2knMYzx51bwSOxpZCibwWYfYtgtLkkgZ1aGfFYTa59BHl86Q88Hqs4zzqKz
         YK3aJ5LcBctCXPdEhCpV/q7yxUr/TjOwZ1JuJNUsSHEfy+efMU5UfUkEue+fGsrnveax
         RkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688630424; x=1691222424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93L8BkPgEfdpngtMZOT+90bXoBGPqeAdqsv/Z4sCp6I=;
        b=a1YilCJGxLUp1tIh9fqJZx1uvoGP7nl4xUNWMGYPBavCDmUQJpBVX7p4r4nZallxBv
         8DxNvW1FB1uVryxFGB703gN7fR+PbKxC1BcpHKIXKZdRSGdkC3WTRwyMsWjIq4rkN6NQ
         VW3lQ4NOIg441aKiLF+3y+5kz4Toy/bSvPP4REaGHXYvC8ikwAxxTZU8KDYgXV7nkMh9
         6dYiAJnYX2+mXCRgTBApzbbe7B3d26XzSok4jwu0GW8nejzDncjjtiqRRA9vol+lSzTt
         7FM9VKhuSG0boRFRD9pHDhJ6DEqquNJ6QvGsR5twGigIo9mQjOe34jKyGUkLXCHKmEsa
         5VkQ==
X-Gm-Message-State: ABy/qLZnukxFyVcP5O1YjuM3k5inPw0Lyx9i9huuYLIAZnoG1bUmrIfr
	wJpBYGX9AKh1ACVHU8XsKUnmWA==
X-Google-Smtp-Source: APBJJlH0UmwL97d4yl5LZFrPLIyAm9frS5cCiPHFs9ODvBbOTYDidw/cS4bYqCerJ4g5RTh7W0WAmQ==
X-Received: by 2002:a1c:ed0d:0:b0:3fa:934c:8350 with SMTP id l13-20020a1ced0d000000b003fa934c8350mr712696wmh.27.1688630424030;
        Thu, 06 Jul 2023 01:00:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b003fbb1ce274fsm5587375wmn.0.2023.07.06.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 01:00:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jul 2023 10:00:20 +0200
Subject: [PATCH 2/3] arm64: dtb: amlogic: meson-g12-common: change
 aobus-pinctrl node name
MIME-Version: 1.0
Message-Id: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-2-63ed070eeab2@linaro.org>
References: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-0-63ed070eeab2@linaro.org>
In-Reply-To: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-0-63ed070eeab2@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=783;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=j0QAC12CtwfrA2b91cLW5DK1eWrkH7AjxGLlYCOHUHQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkpnSUU9xjNbx3BwIiYJT5nPcv/ge5kWU6GfeJ0s8k
 hFc3PyeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKZ0lAAKCRB33NvayMhJ0UHQD/
 4xq6D1Guxs5dlH6ct0+eIOmFXYCUrg+J/IQlW6wT6+ghlC3C6MNL4cKteErw41khgrHPUGMTj7tEkc
 y0e7CELHvDwEZE+Geo0j74JxjrjVhCXLoEJkSff2jdR4cWCx9FTQKmjhLKOsgjP3rv/5cKoQd16luY
 alwYX41SnyHIzKjJsrxXHcERxx6cgoDzVsFz/FoIIpUzBOkVVjJ5nJ/L1ZhdmNQmGLKJMAhs3fwbqW
 1pTCh1BQdfGBqWNFxY0eRgHwRWLo9qTGXnMlaNRX9tSaRLwxxR+9yRuccPgSChBnFqgMXRoRvZVduV
 ZeIVP+VxHUJ1nyOt1I/PCuRvMRjh7sARFMAxjJpnkarG5bKKe9G7yVVlJXNe88amcIgl0qo0IZ/Edr
 4iqMfdKBuBmUJWD3wxZohrarpybgCuxvvOZczrF74ZaAHsR2B3GtkpOLY9RdZ2gKzrDhpTmY+ZOFSn
 JQqBJEIVzpV1fnrw4Ptz644zqrCh24KiujitJvDh2Mp9oQoSQJJC49fReigZq/EgpjQoR/+nHliXlF
 w3tFhI4ngmyUTHe+Vqw6tGGBmtBmHswKXfRfOzFsZsORERL7gn/6bEXsbWHpZdM6e9lQlOyVnNu+EX
 8MytTF78aJJqmimWcjZtzbsbPkgdXZsgNDwlKjAt2etYgD1nqQoIpWFqQsiw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_010027_686614_5CA9A7B2 
X-CRM114-Status: GOOD (  10.21  )
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

Bindings expects name to be "pinctrl", fix it.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0c49655cc90c..6d39faba7c3f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1733,7 +1733,7 @@ clkc_AO: clock-controller {
 					clock-names = "xtal", "mpeg-clk";
 				};
 
-				ao_pinctrl: pinctrl@14 {
+				ao_pinctrl: pinctrl {
 					compatible = "amlogic,meson-g12a-aobus-pinctrl";
 					#address-cells = <2>;
 					#size-cells = <2>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
