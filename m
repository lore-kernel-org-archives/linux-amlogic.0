Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CCDC43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jul 2022 14:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OODlFHuH/k78Zy2CTl052RGAw51izi3wcC/qIr9vlm0=; b=eKJTrn1G0tUBSP
	HkctAJuLiVNs3ONrTTI0PmXS1g5pifsdfFRUOMKo3o03JPKdc+BwhEiA0YMJSt8qRScF6lPzjXou4
	9FXqO4istRC81tTnXOtMc5WvBs0KTnRcjotfnzuI1YeWqNpY2p1k8lL5eM1Ei3MqKyvFa7F5K3/gN
	X1R4kU/dQlGmEId88+916HjvdiFxHxaFgTvBhnPqNGWI9F+n7VRObW3WcBDRS1IYpoD+ccfbj6Bt5
	q7/kVo5n5WFwsMnkQ+cATF0HLcwY+0vIdmb0kqQ+VcwSxhsi1jgLzUNc9SQrtwOHfqwqTQpZ6v3oe
	QYkPlgdb4oXR7GS/iD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGqG-00BhPR-G6; Tue, 12 Jul 2022 14:26:24 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGq9-00BhIE-Dr; Tue, 12 Jul 2022 14:26:19 +0000
Received: by mail-io1-f45.google.com with SMTP id n68so7975049iod.3;
        Tue, 12 Jul 2022 07:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Mwfd/m3zpk78sJK7nn2vE1VYk2hb35cFLS9pd42jCiI=;
        b=hssHQcGg1YUgUTe60UG3pzBRTUsMSLzHKc+0xfhAY3bf+ZS1DcyULjvEDosXWAYrL1
         DONvs45LLh184I8AnK9vFU0Xt7c4q8zIkIjmPvlg9RTWao4UlCkB/DtDYjtuwYq2szJa
         w8qHk7HYriaUsdZQ5nXTgJwj39AYda87y+ZsYXktYBQAF0Oc/BQm59syZfCG1pqRgpF3
         +SL7icNBuzotZi9mkJZY/LtynkDUAM4nlSVtIf1dqmx9jNqV8D4gxPbt2qQoG42xTYBq
         LQvgLS8YGf1zmCM1DUF5qaeZa/WwmExPEuohfG6eMeC675yExeq96VQYjwVlG2Na79pu
         JUmA==
X-Gm-Message-State: AJIora8gpiCrnPtoKcqb2dtq5BQ2Qc39I0FVC5y8nt8ZtJ6k1KxUqB51
	NDnfj0qBAoL7hK8pc/6c4A==
X-Google-Smtp-Source: AGRyM1uQLAcirqFEfLkDKLsk9TU4a8owrMVfxUjgaeO2hrKaXbUywPSmFTal17hen3JlJmxPkXBYqQ==
X-Received: by 2002:a05:6638:218c:b0:33c:9cae:166d with SMTP id s12-20020a056638218c00b0033c9cae166dmr13409432jaj.223.1657635973941;
        Tue, 12 Jul 2022 07:26:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w8-20020a92d608000000b002dc0e7027edsm3799668ilm.32.2022.07.12.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 07:26:13 -0700 (PDT)
Received: (nullmailer pid 1805847 invoked by uid 1000);
	Tue, 12 Jul 2022 14:26:12 -0000
From: Rob Herring <robh@kernel.org>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, Chris Healy <cphealy@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mark Rutland <mark.rutland@arm.com>
In-Reply-To: <20220712063641.2790997-4-jiucheng.xu@amlogic.com>
References: <20220712063641.2790997-1-jiucheng.xu@amlogic.com> <20220712063641.2790997-4-jiucheng.xu@amlogic.com>
Subject: Re: [PATCH 4/4] dt-binding:perf: Add Amlogic DDR PMU
Date: Tue, 12 Jul 2022 08:26:12 -0600
Message-Id: <1657635972.094089.1805846.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_072617_500619_FD6F7C73 
X-CRM114-Status: GOOD (  13.34  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 12 Jul 2022 14:36:41 +0800, Jiucheng Xu wrote:
> Add binding documentation for the Amlogic G12 series DDR
> performance monitor unit.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
>  .../devicetree/bindings/perf/aml-ddr-pmu.yaml | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/perf/aml-ddr-pmu.example.dts'
Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml:51:5: did not find expected '-' indicator
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/perf/aml-ddr-pmu.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/bin/yamllint", line 33, in <module>
    sys.exit(load_entry_point('yamllint==1.26.3', 'console_scripts', 'yamllint')())
  File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 210, in run
    prob_level = show_problems(problems, file, args_format=args.format,
  File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 106, in show_problems
    for problem in problems:
  File "/usr/lib/python3/dist-packages/yamllint/linter.py", line 203, in _run
    for problem in get_cosmetic_problems(buffer, conf, filepath):
  File "/usr/lib/python3/dist-packages/yamllint/linter.py", line 140, in get_cosmetic_problems
    for problem in rule.check(rule_conf,
  File "/usr/lib/python3/dist-packages/yamllint/rules/indentation.py", line 580, in check
    for problem in _check(conf, token, prev, next, nextnext, context):
  File "/usr/lib/python3/dist-packages/yamllint/rules/indentation.py", line 346, in _check
    'wrong indentation: expected %d but found %d' %
TypeError: %d format: a real number is required, not NoneType
./Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml:51:5: did not find expected '-' indicator
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml: ignoring, error parsing file
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
